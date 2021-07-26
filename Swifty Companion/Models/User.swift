//
//  User.swift
//  Swifty Companion
//
//  Created by Saturn Karry on 7/1/21.
//

import Foundation

struct ProjectInfo: Codable {
    let name: String
    let slug: String
}

struct Project: Codable {
    let final_mark: Int?
    let project: ProjectInfo
    let validated: Bool?
    
    enum CodingKeys: String, CodingKey {
        case final_mark
        case project
        case validated = "validated?"
    }
}

struct Campus: Codable {
    let name: String
}

struct Cursus: Codable {
    let cursus_id: Int
    let level: Double
}

struct User: Codable {
    let displayname: String
    let login: String
    let image_url: String
    let location: String?
    let pool_month: String
    let pool_year: String
    let projects_users: [Project]
    let campus: [Campus]
    let cursus_users: [Cursus]
}

