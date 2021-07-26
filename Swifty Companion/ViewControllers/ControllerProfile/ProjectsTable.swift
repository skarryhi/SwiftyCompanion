//
//  ProjectsTable.swift
//  Swifty Companion
//
//  Created by Saturn Karry on 7/26/21.
//

import UIKit

extension ProfileController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectCell", for: indexPath) as! ProjectCell
        cell.project.text = projects[indexPath.row].0
        cell.proc.text = projects[indexPath.row].1
        return cell
    }
}
