//
//  PresentCellData.swift
//  Swifty Companion
//
//  Created by Анна Заблуда on 19.07.2021.
//

import UIKit

class PresenterOfCell {
    
    private func setupLevel(_ cell: ProfileCell, for user: User) {
        
        cell.level.isHidden = false
        let lvl = user.cursus_users.last!.level
        let dobleLevel = lvl - Float(Int(lvl))
        cell.level.setProgress(dobleLevel, animated: true)
        cell.levelLable.text = "level \(Int(lvl)) - \(Int(dobleLevel * 100))%"
    }
    
    private func setupLocation(_ cell: ProfileCell, for user: User) {
        let cumpusName = user.campus.last?.name ?? ""
        if let online = user.location {
            cell.userOnline.text = "Location: \(cumpusName)\n\(online)"
        } else {
            cell.userOnline.text = "Location: \(cumpusName)\noffline"
        }
    }
    
    func setupCell(_ cell: ProfileCell, for user: User, with image: UIImage) {
        cell.indicator.stopAnimating()
        
        
        cell.userImage.image = image
        cell.userNamePool.text = ("\(user.displayname), \(user.login)\n\nPool: \(user.pool_month) \(user.pool_year)")
        
        setupLocation(cell, for: user)
        setupLevel(cell, for: user)
    }
    
    func noLogin(_ cell: ProfileCell) {
//        sleep(1)
        cell.indicator.stopAnimating()
        
        cell.userNamePool.text = "Login not found"
    }
    
}
