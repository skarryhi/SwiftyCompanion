//
//  AccessToken.swift
//  Swifty Companion
//
//  Created by Анна Заблуда on 30.06.2021.
//

import Foundation

struct AccessToken: Codable {
    let access_token: String
    let token_type: String
}

struct ErrorAccessToken: Codable {
    let error: String
}
