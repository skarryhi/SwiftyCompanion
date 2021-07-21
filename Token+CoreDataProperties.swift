//
//  Token+CoreDataProperties.swift
//  Swifty Companion
//
//  Created by Анна Заблуда on 19.07.2021.
//
//

import Foundation
import CoreData


extension Token {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Token> {
        return NSFetchRequest<Token>(entityName: "Token")
    }

    @NSManaged public var access_token: String?
    @NSManaged public var token_type: String?

}

extension Token : Identifiable {

}
