//
//  UserDefaults+Extension.swift
//  canWeCoodinate
//
//  Created by Josh Franco on 4/1/20.
//  Copyright © 2020 Josh Franco. All rights reserved.
//

import Foundation

extension UserDefaults {
    private enum keys: String {
        case userName = "User_Name"
        case password = "Password"
        case isUserLoggedIn = "Is_User_Logged_In"
    }
    
    var userName: String? {
        get {
            return UserDefaults.standard.string(forKey: keys.userName.rawValue)
        } set {
            UserDefaults.standard.setValue(newValue, forKey: keys.userName.rawValue)
        }
    }
    
    var password: String? {
        get {
            return UserDefaults.standard.string(forKey: keys.password.rawValue)
        } set {
            UserDefaults.standard.setValue(newValue, forKey: keys.password.rawValue)
        }
    }
    
    var isUserLoggedIn: Bool {
        get {
            return UserDefaults.standard.bool(forKey: keys.isUserLoggedIn.rawValue)
        } set {
            UserDefaults.standard.setValue(newValue, forKey: keys.isUserLoggedIn.rawValue)
        }
    }
}
