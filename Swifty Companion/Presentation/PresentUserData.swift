//
//  PresentUserData.swift
//  Swifty Companion
//
//  Created by Анна Заблуда on 19.07.2021.
//

import UIKit


protocol SetupUser: class {
    func setupUser(for user: User, with image: UIImage)
    func noLogin()
}

extension ProfileController: SetupUser {
    
    func setupUser(for user: User, with image: UIImage) {
        indicator.stopAnimating()
        
        
        userImage.image = image
        userNamePool.text = ("\(user.displayname), \(user.login)\n\nPool: \(user.pool_month) \(user.pool_year)")
        
        setupLocation(for: user)
        setupLevel(for: user)
    }
    
    func noLogin() {
        indicator.stopAnimating()
        
        userImage.image = #imageLiteral(resourceName: "IMAGE 2021-07-25 18:45:14")
        userNamePool.text = "Login not found   "
    }
    
    
    
    
    private func setupLevel(for user: User) {
        
        level.isHidden = false
        let lvl = user.cursus_users.last!.level
        let arrLevel = String(lvl).split(separator: ".")
        let progress = Float("0.\(arrLevel.last!)")!
        level.setProgress(progress, animated: true)
        levelLable.text = "level \(arrLevel.first!) - \(arrLevel.last!)%"
    }
    
    private func setupLocation(for user: User) {
        let cumpusName = user.campus.last?.name ?? ""
        if let online = user.location {
            userOnline.text = "Location: \(cumpusName)\n\(online)"
        } else {
            userOnline.text = "Location: \(cumpusName)\noffline"
        }
    }
}
