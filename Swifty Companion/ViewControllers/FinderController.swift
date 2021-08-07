//
//  ViewController.swift
//  Swifty Companion
//
//  Created by Анна Заблуда on 29.06.2021.
//

import UIKit

protocol ManagerApi: AnyObject {
    var manager42: Manager42 { get }
}

protocol ManagerData: AnyObject {
    var managerData: ManagerData { get }
}

class FinderController: UIViewController, UITextFieldDelegate, ManagerApi {
    
    var textField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "Enter 42 login"
        tf.returnKeyType = .search
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        return tf
    }()
    
    var lable: UILabel = {
        let lable = UILabel()
        lable.text = "🔍 Search "
        lable.textAlignment = .center
        return lable
    }()
    
    let manager42 = Manager42()
    let managerData = Dataworking()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager42.dataworking = managerData
        setupController()
    }
    
    private func enableHideKeyboard() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    // MARK: - View
    
    private func setupController() {
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textField.delegate = self
        addTextField()
        addLable()
        enableHideKeyboard()
    }
    
    private func addTextField() {
        view.addSubview(textField)
        textField.anchor(left: view.safeAreaLayoutGuide.centerXAnchor,
                         bottom: view.safeAreaLayoutGuide.centerYAnchor,
                         right: view.safeAreaLayoutGuide.centerXAnchor,
                         
                         paddingLeft: -(UIScreen.main.bounds.width / 2.5),
                         paddingBottom: UIScreen.main.bounds.width / 20,
                         paddingRight: -(UIScreen.main.bounds.width / 2.5),
                         
                         height: 40)
    }
    
    private func addLable() {
        view.addSubview(lable)
        lable.anchor(left: textField.leftAnchor,
                     bottom: textField.topAnchor,
                     right: textField.rightAnchor,
                     
                     paddingBottom: 5,
                     
                     height: 40)
    }
    
    // MARK: - TextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        let vc = ProfileController()
        if let text = textField.text, textField.text != "" {
            vc.login = text
            vc.managerApi = self
            manager42.presenterForUser = vc
            present(vc, animated: true, completion: nil)
        }
        return true
    }
    
}
