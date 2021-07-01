//
//  Manager42.swift
//  Swifty Companion
//
//  Created by Анна Заблуда on 30.06.2021.
//

import UIKit

class Manager42 {
    private let uid = "5d02c0d91ec69f36ead487e1ebb389199f061d34bf658bf433fcf6c4558c5d55"
    private let secret = "14e00b9b1b8e40655f0d2c51d896955f3567227911ac965fa4f4ab39636365dc"
    private let scheme = "https"
    private let host = "api.intra.42.fr"
    private let pathToken = "/oauth/token"
    private let pathUser = "/v2/users/"
    private var accessToken: AccessToken?

    static let shared = Manager42()
    private init() {}
    
    
    func requestAccessToken() {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = pathToken
        components.queryItems = [
            URLQueryItem(name: "grant_type", value: "client_credentials"),
            URLQueryItem(name: "client_id", value: uid),
            URLQueryItem(name: "client_secret", value: secret)
        ]
        
        guard let url = components.url else {
            print("no connect")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print("NO HAVE DATA")
                return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch { print (error) }
            
            if let jsonResult = try? JSONDecoder().decode(AccessToken.self, from: data) {
                self.accessToken = jsonResult
            }
            else { print("Not convert") }
        }.resume()
    }
    
    func getUser(for login: String, in cell: ProfileCell) {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = pathUser + login
        guard let url = components.url else {
            print("no connect")
            return
        }
        var request = URLRequest(url: url)
        guard let autorization1 = accessToken?.token_type,
            let autorization2 = accessToken?.access_token else { return }
        let autorization = autorization1 + " " + autorization2
        request.addValue(autorization, forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print("NO HAVE DATA")
                return }
            
//            do {
//                let json = try JSONSerialization.jsonObject(with: data, options: [])
//                print(json)
//            } catch { print (error) }

            if let user = try? JSONDecoder().decode(User.self, from: data) {
                print(user)
                var image = #imageLiteral(resourceName: "Image")
                if user.image_url != "https://cdn.intra.42.fr/users/default.png" {
                    guard let url = URL(string: user.image_url),
                    let data = try? Data(contentsOf: url),
                    let img = UIImage(data: data)else {return}
                    image = img}
                DispatchQueue.main.async {
                    self.setupCell(cell, for: user, with: image)
                }
            }
            else { print("Not convert") }
        }.resume()
    }
    
    func setupCell(_ cell: ProfileCell, for user: User, with image: UIImage) {
        cell.indicator.stopAnimating()
        cell.userImage.image = image
        let wave = user.cursus_users.first!.cursus_id
        cell.userNamePool.text = ("\(user.displayname), \(user.login)\n\nPool: \(user.pool_month) \(user.pool_year) (\(wave) wave)")
        let cumpusName = user.campus.last?.name ?? ""
        if let online = user.location {
            cell.userOnline.text = "Location: \(cumpusName)\n\(online)"
        } else {
            cell.userOnline.text = "Location: \(cumpusName)\noffline"
        }
        cell.level.isHidden = false
        let lvl = user.cursus_users.last!.level
        let dobleLevel = lvl - Float(Int(lvl))
        cell.level.setProgress(dobleLevel, animated: true)
        cell.levelLable.text = "level \(Int(lvl)) - \(Int(dobleLevel * 100))%"
    }
}
