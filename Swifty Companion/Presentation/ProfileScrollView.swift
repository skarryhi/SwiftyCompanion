//
//  ProfileScrollView.swift
//  Swifty Companion
//
//  Created by Анна Заблуда on 07.08.2021.
//

import UIKit

final class ProfileScrollView: UIScrollView {
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    
    lazy var indicator: UIActivityIndicatorView = {
        let i = UIActivityIndicatorView(frame: CGRect(x: screenWidth * 0.5 - 25,
                                                      y:  screenHeight * 0.4,
                                                      width: 50,
                                                      height: 50))
        addSubview(i)
        return i
    }()
    
    lazy var userImage: UIImageView = {
        let im = UIImageView(frame: CGRect(x: screenWidth * 0.25,
                                           y: screenHeight * 0.05,
                                           width: screenWidth * 0.5,
                                           height: screenWidth * 0.53))
        im.contentMode = .scaleAspectFit
        addSubview(im)
        return im
    }()
    
    lazy var userNamePool: UILabel = {
        let lbl = UILabel(frame: CGRect(x: screenWidth * 0.05,
                                        y: screenHeight * 0.1 + screenWidth * 0.53,
                                        width: screenWidth * 0.9,
                                        height: screenHeight * 0.20))
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        addSubview(lbl)
        return lbl
    }()
    
    
    lazy var userLocation: UILabel = {
        let lbl = UILabel(frame: CGRect(x: screenWidth * 0.05,
                                        y: screenHeight * 0.25 + screenWidth * 0.53,
                                        width: screenWidth * 0.9,
                                        height: screenHeight * 0.20))
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        addSubview(lbl)
        return lbl
    }()
    
    lazy var level: UIProgressView = {
        let pr = UIProgressView()
        pr.progressTintColor = #colorLiteral(red: 0, green: 0.5519087315, blue: 0.1911308467, alpha: 1)
        pr.backgroundColor = #colorLiteral(red: 0.9809446931, green: 0.6558958888, blue: 0.105969511, alpha: 1)
        pr.progressViewStyle = .bar
        pr.layer.cornerRadius = UIScreen.main.bounds.height / 80
        pr.clipsToBounds = true
        pr.layer.sublayers![1].cornerRadius = UIScreen.main.bounds.height / 80
        pr.subviews[1].clipsToBounds = true
        addSubview(pr)
        pr.anchor(top: topAnchor,
                        left: leftAnchor,
                        paddingTop: screenHeight * 0.50 + screenWidth * 0.53,
                        paddingLeft: screenWidth * 0.1,
                        width: screenWidth * 0.8,
                        height: screenHeight * 0.03)
        return pr
    }()
    
    lazy var levelLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        addSubview(lbl)
        lbl.anchor(top: level.topAnchor,
                        left: level.leftAnchor,
                        bottom: level.bottomAnchor,
                        right: level.rightAnchor)
        return lbl
    }()
    
    lazy var projects: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.attributedText = NSMutableAttributedString()
        addSubview(lbl)
        lbl.anchor(top: topAnchor,
                        left: level.leftAnchor,
                        bottom: bottomAnchor,
                        right: level.rightAnchor,
                        paddingTop: screenHeight * 0.75 + screenWidth * 0.53,
                        paddingBottom: screenHeight * 0.1)
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        alwaysBounceVertical = true
        indicator.startAnimating()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
