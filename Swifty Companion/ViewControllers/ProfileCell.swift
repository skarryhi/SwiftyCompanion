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
        indicator.anchor(top: safeAreaLayoutGuide.topAnchor,
                         left: safeAreaLayoutGuide.centerXAnchor,
                         bottom: nil,
                         right: nil,
                         paddingTop: UIScreen.main.bounds.height / 2.5,
                         paddingLeft: -25,
                         paddingBottom: 0,
                         paddingRight: 0,
                         width: 50,
                         height: 50,
                         enableInsets: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

