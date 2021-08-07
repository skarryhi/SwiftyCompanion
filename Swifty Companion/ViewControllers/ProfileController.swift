//
//  ProfileController.swift
//  Swifty Companion
//
//  Created by Анна Заблуда on 29.06.2021.
//

import UIKit

final class ProfileController: UIViewController {
    
    var login = ""
    weak var managerApi: ManagerApi?
    
    lazy var scrollView: ProfileScrollView = {
      let sv = ProfileScrollView(frame: self.view.frame)
        self.view.addSubview(sv)
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.isHidden = false
        managerApi?.manager42.getUser(for: login)
    }
}
