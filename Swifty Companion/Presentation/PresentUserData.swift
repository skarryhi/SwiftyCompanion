//
//  PresentUserData.swift
//  Swifty Companion
//
//  Created by Анна Заблуда on 19.07.2021.
//

import UIKit


protocol SetupUser: class {
    func setupUser(for user: User, with image: [UIImage])
    func noLogin()
}

extension ProfileController: SetupUser {
    
    func setupUser(for user: User, with image: [UIImage]) {
        indicator.stopAnimating()
        
        
        userImage.animationImages = image
        userImage.startAnimating()
        userNamePool.text = ("\(user.displayname), \(user.login)\n\nPool: \(user.pool_month) \(user.pool_year)")
        
        setupLocation(for: user)
        setupLevel(for: user)
        setupProjects(user.projects_users)
    }
    
    func noLogin() {
        indicator.stopAnimating()
        
        userImage.image = #imageLiteral(resourceName: "IMAGE 2021-07-25 18:45:14")
        userNamePool.text = "Login not found   "
    }
    
    
    private func setupProjects(_ proj: [Project]) {
        var exams = [(String, Bool?)]()
        var c42 = [(String, Bool?)]()
        for i in proj {
            if i.project.name.lowercased().contains("exam") && !i.project.slug.lowercased().contains("piscine") {
                exams.append((i.project.name, i.validated))
            } else if !i.project.slug.lowercased().contains("piscine") && !i.project.slug.contains("bsq") {
                c42.append((i.project.name, i.validated))
            }
        }
        let res = NSMutableAttributedString()
        exams += [("", nil)] + c42
        exams.forEach {
            var str = NSAttributedString()
            if let val = $0.1 {
                if val {
                    str = NSAttributedString(string: $0.0 + "\n", attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0, green: 0.5363702178, blue: 0.1889698505, alpha: 1),
                                                                                      NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)])
                } else {
                    str = NSAttributedString(string: $0.0 + "\n", attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.7372969985, green: 0.1176088527, blue: 0.01814407855, alpha: 1),
                                                                               NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)])
                }
            } else {
                str = NSAttributedString(string: $0.0 + "\n", attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.8798888326, green: 0.5868710876, blue: 0.09822719544, alpha: 1),
                                                                           NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)])
            }
            res.append(str)
        }
        projects.attributedText = res
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
