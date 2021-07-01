//
//  ProfileController.swift
//  Swifty Companion
//
//  Created by Анна Заблуда on 29.06.2021.
//

import UIKit

class ProfileController: UITableViewController {

    var login = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.allowsSelection = false
        tableView.register(ProfileCell.self, forCellReuseIdentifier: "OneProfile")
        tableView.separatorStyle = .none
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OneProfile", for: indexPath)
        cell.textLabel?.text = login
        return cell
    }
}
