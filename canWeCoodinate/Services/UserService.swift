//
//  UserService.swift
//  canWeCoodinate
//
//  Created by Josh Franco on 4/1/20.
//  Copyright © 2020 Josh Franco. All rights reserved.
//

import Foundation

class UserService {
    var isUserLoggedIn: Bool {
        get {
            return UserDefaults.standard.isUserLoggedIn
        }
    }
    
    var userName: String? {
        get {
            return UserDefaults.standard.userName
        }
    }
    
    private var password: String? {
        get {
            return UserDefaults.standard.password
        }
    }
    
    func signUpUser(with userName: String, and password: String) {
        UserDefaults.standard.userName = userName
        UserDefaults.standard.password = password
        UserDefaults.standard.isUserLoggedIn = true
    }
    
    func logInUser() {
        UserDefaults.standard.isUserLoggedIn = true
    }
    
    func validate(using userName: String, and password: String) -> Bool {
        return self.userName == userName && self.password == password
    }
    
    func logout() {
        UserDefaults.standard.isUserLoggedIn = false
    }
}
