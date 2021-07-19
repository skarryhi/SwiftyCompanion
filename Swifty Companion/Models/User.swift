//
//  User.swift
//  Swifty Companion
//
//  Created by Saturn Karry on 7/1/21.
//

import Foundation

struct ProjectInfo: Codable {
    let name: String
}

struct Project: Codable {
    let status: String
    let cursus_ids: [Int]
    let project: ProjectInfo
}

struct Campus: Codable {
    let name: String
}

struct Cursus: Codable {
    let cursus_id: Int
    let level: Float
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

