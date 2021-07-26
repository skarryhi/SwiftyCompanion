//
//  ManagerData.swift
//  Swifty Companion
//
//  Created by Saturn Karry on 7/24/21.
//

import UIKit
import CoreData

class Dataworking {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func fetchToken(complition: (Token) -> Void ) {
        do {
            let data: [Token] = try context.fetch(Token.fetchRequest())

            if let getted = data.last {
                complition(getted)
                if let tok = getted.access_token {
                    print("getFromCach: \(tok)")
                }
            }
            
        } catch {
            print("can't get data")
        }
    }
    
    func rewriteToken(old t: Token?, new newToken: AccessToken, complition: (Token) -> Void ) {
        if let token = t {
            self.context.delete(token)
            do {
                try self.context.save()
            } catch {
                print("Does't save")
            }
        }
        let newT = Token(context: self.context)
        newT.access_token = newToken.access_token
        newT.token_type = newToken.token_type
        do {
            try self.context.save()
        } catch {
            print("Does't save")
        }
        self.fetchToken { token in
            complition(token)
        }
    }
}
