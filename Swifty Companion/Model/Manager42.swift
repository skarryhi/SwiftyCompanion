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
    private let url = "https://api.intra.42.fr/oauth/token"
    static let shared = Manager42()
    private init() {}
    
    func requestAnAccess() {
        guard let url = URL(string: url) else {
            print("no url")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let param = [
            "grant_type" : "client_credentials",
            "client_id" : uid,
            "client_secret" : secret,
        ]
        guard let json = try? JSONSerialization.data(withJSONObject: param, options: [])
        else {
            print("no json")
            return
        }
        request.httpBody = Data(base64Encoded: "grant_type=client_credentials&client_id=5d02c0d91ec69f36ead487e1ebb389199f061d34bf658bf433fcf6c4558c5d55&client_secret=14e00b9b1b8e40655f0d2c51d896955f3567227911ac965fa4f4ab39636365dc")
//        request.addValue("client_credentials", forHTTPHeaderField: "grant_type")
//        request.addValue(uid, forHTTPHeaderField: "client_id")
//        request.addValue(secret, forHTTPHeaderField: "client_secret")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print("NO HAVE DATA")
                return }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print (error)
            }
            if let jsonResult = try? JSONDecoder().decode(AccessToken.self, from: data) {
                print(jsonResult)
                }
            else {
                print("Not convert")
            }
        }.resume()
    }
}
