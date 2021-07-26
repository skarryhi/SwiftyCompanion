//
//  ProjectCell.swift
//  Swifty Companion
//
//  Created by Saturn Karry on 7/26/21.
//

import UIKit

class ProjectCell: UITableViewCell {
    
    
    var proc: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textAlignment = .right
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(project)
        contentView.addSubview(proc)

        project.anchor(top: contentView.topAnchor,
                        left: contentView.leftAnchor,
                        bottom: contentView.bottomAnchor,
                        
                        width: UIScreen.main.bounds.width / 1.8)
        
        proc.anchor(top: contentView.bottomAnchor,
                   right: contentView.rightAnchor,
                   
                   width: UIScreen.main.bounds.width / 5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
