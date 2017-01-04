//
//  User.swift
//  Keeper
//
//  Created by sakuke on 12/29/16.
//  Copyright © 2016 Quang. All rights reserved.
//

import Foundation

class User {
    
    private var _email: String!
    private var _password: String!
    private var _username: String!
    
    var email: String! {
        get {
            return _email
        }
        set {
            _email = newValue
        }
    }
    
    var password: String! {
        
        get {
            return _password
        }
        set {
            _password = newValue
        }
    }
    
    var username: String! {
        
        get {
            return _username
        }
        set {
            _username = newValue
        }
    }
    
    init() {
        
    }
    
    func isBlankEmail() -> Bool {
        
        if _email == nil || _email == "" {
            
            return true
        }
            return false
    }
    
    func isValidEmail(testStr:String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
        
    }
    
    func emptyPassword()  -> Bool {
        if _password == nil || _password == "" {
            return true
        }
        return false
    }
    
}
