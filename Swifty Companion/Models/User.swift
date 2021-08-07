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
    let finalMark: Int?
    let project: ProjectInfo
    let validated: Bool?
    
    enum CodingKeys: String, CodingKey {
        case finalMark = "final_mark"
        case project
        case validated = "validated?"
    }
}

struct Campus: Codable {
    let name: String
}

struct Cursus: Codable {
    let cursusId: Int
    let level: Double
    
    enum CodingKeys: String, CodingKey {
        case cursusId = "cursus_id"
        case level
    }
}

struct User: Codable {
    let displayname: String
    let login: String
    let imageUrl: String
    let location: String?
    let poolMonth: String
    let poolYear: String
    let projectsUsers: [Project]
    let campus: [Campus]
    let cursusUsers: [Cursus]
    
    enum CodingKeys: String, CodingKey {
        case displayname
        case login
        case imageUrl = "image_url"
        case location
        case poolMonth = "pool_month"
        case poolYear = "pool_year"
        case projectsUsers = "projects_users"
        case campus
        case cursusUsers = "cursus_users"
    }
}

