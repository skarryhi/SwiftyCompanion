//
//  ProfileCell.swift
//  Swifty Companion
//
//  Created by Анна Заблуда on 29.06.2021.
//

import UIKit

class ProfileCell: UITableViewCell {

//    var image: UIImage
    var indicator: UIActivityIndicatorView = {
       return UIActivityIndicatorView()
    }()
    
    var userImage: UIImageView = {
        let im = UIImageView()
        im.contentMode = UIImageView.ContentMode.scaleAspectFit
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    
        
        addSubview(indicator)
        indicator.startAnimating()
        indicator.anchor(top: topAnchor,
                         left: centerXAnchor,
                         bottom: nil,
                         right: nil,
                         paddingTop: UIScreen.main.bounds.height / 2.5,
                         paddingLeft: -25,
                         paddingBottom: 0,
                         paddingRight: 0,
                         width: 50,
                         height: 50,
                         enableInsets: false)
        
        
        addSubview(userImage)
        userImage.anchor(top: topAnchor,
                         left: leftAnchor,
                         bottom: nil,
                         right: rightAnchor,
                         paddingTop: UIScreen.main.bounds.height / 20,
                         paddingLeft: UIScreen.main.bounds.width / 4,
                         paddingBottom: 0,
                         paddingRight: UIScreen.main.bounds.width / 4,
                         width: 0,
                         height: UIScreen.main.bounds.width / 6 * 4,
                         enableInsets: false)
        
        addSubview(userNamePool)
        userNamePool.anchor(top: userImage.bottomAnchor,
                         left: leftAnchor,
                         bottom: nil,
                         right: rightAnchor,
                         paddingTop: UIScreen.main.bounds.height / 20,
                         paddingLeft: UIScreen.main.bounds.width / 20,
                         paddingBottom: 0,
                         paddingRight: UIScreen.main.bounds.width / 20,
                         width: 0,
                         height: UIScreen.main.bounds.height / 10,
                         enableInsets: false)
        
        addSubview(userOnline)
        userOnline.anchor(top: userNamePool.bottomAnchor,
                         left: leftAnchor,
                         bottom: nil,
                         right: rightAnchor,
                         paddingTop: UIScreen.main.bounds.height / 20,
                         paddingLeft: UIScreen.main.bounds.width / 20,
                         paddingBottom: 0,
                         paddingRight: UIScreen.main.bounds.width / 20,
                         width: 0,
                         height: UIScreen.main.bounds.height / 15,
                         enableInsets: false)
        
        addSubview(level)
        level.anchor(top: userOnline.bottomAnchor,
                         left: leftAnchor,
                         bottom: bottomAnchor,
                         right: rightAnchor,
                         paddingTop: UIScreen.main.bounds.height / 25,
                         paddingLeft: UIScreen.main.bounds.width / 10,
                         paddingBottom: 0,
                         paddingRight: UIScreen.main.bounds.width / 10,
                         width: 0,
                         height: UIScreen.main.bounds.height / 30,
                         enableInsets: false)

        addSubview(levelLable)
        levelLable.anchor(top: level.topAnchor,
                          left: level.leftAnchor,
                          bottom: level.bottomAnchor,
                          right: level.rightAnchor,
                         paddingTop: 0,
                         paddingLeft: 0,
                         paddingBottom: 0,
                         paddingRight: 0,
                         width: 0,
                         height: 0,
                         enableInsets: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}

