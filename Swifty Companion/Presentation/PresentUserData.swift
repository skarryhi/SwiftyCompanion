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
        setupProjects(user.projects_users)
    }
    
    func noLogin() {
        indicator.stopAnimating()
        
        userImage.image = #imageLiteral(resourceName: "IMAGE 2021-07-25 18:45:14")
        userNamePool.text = "Login not found   "
    }
    
    
    private func setupProjects(_ proj: [Project]) {
        var exams = [Project]()
        var c42 = [Project]()
        for i in proj {
            if i.project.name.contains("Exam Rank") {
                exams.append(i)
            } else if !i.project.slug.contains("iscine") &&
                !i.project.slug.contains("bsq") {
                c42.append(i)
            }
        }

        exams.forEach {
            projects.text! += "\($0.project.name)\n"
            if let mark = $0.final_mark {
                proc.text! += "\(mark)\n"
            } else {
                proc.text! += "0\n"
            }
        }
        
        projects.text! += "\n"
        proc.text! += "\n"
        
        c42.forEach {
            projects.text! += "\($0.project.name)\n"
            if let mark = $0.final_mark {
                proc.text! += "\(mark)\n"
            } else {
                proc.text! += "0\n"
            }
        }
        
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
