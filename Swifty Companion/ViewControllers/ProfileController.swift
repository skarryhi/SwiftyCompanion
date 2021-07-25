//
//  ProfileController.swift
//  Swifty Companion
//
//  Created by Анна Заблуда on 29.06.2021.
//

import UIKit

class ProfileController: UIViewController {
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        sv.alwaysBounceVertical = true
        return sv
    }()
    
    var indicator: UIActivityIndicatorView = {
        let i = UIActivityIndicatorView()
        i.startAnimating()
        return i
    }()
    
    var userImage: UIImageView = {
        let im = UIImageView()
        im.layer.masksToBounds = true
        return im
    }()
    
    var userNamePool: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        return lbl
    }()
    
    var userOnline: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        return lbl
    }()
    
    var level: UIProgressView = {
        let pr = UIProgressView()
        pr.progressTintColor = #colorLiteral(red: 0, green: 0.5519087315, blue: 0.1911308467, alpha: 1)
        pr.backgroundColor = #colorLiteral(red: 0.9809446931, green: 0.6558958888, blue: 0.105969511, alpha: 1)
        pr.isHidden = true
        pr.progressViewStyle = .bar
        pr.layer.cornerRadius = UIScreen.main.bounds.height / 80
        pr.clipsToBounds = true
        pr.layer.sublayers![1].cornerRadius = UIScreen.main.bounds.height / 80
        pr.subviews[1].clipsToBounds = true
        return pr
    }()
    
    var levelLable: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return lbl
    }()
    
    var projects: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.text = ""
        return lbl
    }()
    
    var proc: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.text = ""
        lbl.textAlignment = .right
        return lbl
    }()
    
    var login = ""
    weak var managerApi: ManagerApi?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(indicator)
        scrollView.addSubview(userImage)
        scrollView.addSubview(userNamePool)
        scrollView.addSubview(userOnline)
        scrollView.addSubview(level)
        scrollView.addSubview(levelLable)
        scrollView.addSubview(projects)
        scrollView.addSubview(proc)
        
        setupConstraints()
        
        managerApi?.manager42.getUser(for: login)
    }
    
    private func setupConstraints() {
        
        scrollView.anchor(top: view.topAnchor,
                          left: view.leftAnchor,
                          bottom: view.bottomAnchor,
                          right: view.rightAnchor)
        
        
        
        indicator.anchor(top: view.topAnchor,
                         left: view.centerXAnchor,
                         
                         paddingTop: screenHeight / 2.5,
                         paddingLeft: -25,
                         
                         width: 50,
                         height: 50)
        
        
        userImage.anchor(top: scrollView.topAnchor,
                         left: scrollView.leftAnchor,
                         
                         paddingTop: screenHeight / 20,
                         paddingLeft: screenWidth / 4,
                         
                         
                         width: screenWidth / 2,
                         height: screenWidth / 6 * 3.2)
        
        
        userNamePool.anchor(top: userImage.bottomAnchor,
                            left: scrollView.leftAnchor,
                            
                            paddingTop: screenHeight / 20,
                            paddingLeft: screenWidth / 20,
                            
                            width: screenWidth - screenWidth / 10,
                            height: screenHeight / 10)
        
        
        userOnline.anchor(top: userNamePool.bottomAnchor,
                          left: scrollView.leftAnchor,
                          
                          paddingTop: screenHeight / 20,
                          paddingLeft: screenWidth / 20,
                          
                          width: screenWidth - screenWidth / 10,
                          height: screenHeight / 15)
        
        
        level.anchor(top: userOnline.bottomAnchor,
                     left: scrollView.leftAnchor,
                     
                     paddingTop: screenHeight / 25,
                     paddingLeft: screenWidth / 10,
                     
                     width: screenWidth - screenWidth / 5,
                     height: screenHeight / 30)
        
        
        levelLable.anchor(top: level.topAnchor,
                          left: level.leftAnchor,
                          bottom: level.bottomAnchor,
                          right: level.rightAnchor)
        
        projects.anchor(top: level.bottomAnchor,
                        left: level.leftAnchor,
                        bottom: scrollView.bottomAnchor,
                        
                        paddingTop: screenHeight / 20,
                        
                        width: screenWidth / 1.8)
        
        proc.anchor(top: level.bottomAnchor,
                    right: level.rightAnchor,
                    
                    paddingTop: screenHeight / 20,
                    
                    width: screenWidth / 5)
        
    }
}
