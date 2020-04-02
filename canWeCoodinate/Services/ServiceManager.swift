//
//  ServiceManager.swift
//  canWeCoodinate
//
//  Created by Josh Franco on 4/1/20.
//  Copyright © 2020 Josh Franco. All rights reserved.
//

import Foundation

class ServiceManager {
    let userService: UserService
    
    init() {
        self.userService = UserService()
    }
}
