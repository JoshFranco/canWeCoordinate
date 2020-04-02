//
//  LandingViewController.swift
//  canWeCoodinate
//
//  Created by Josh Franco on 3/28/20.
//  Copyright © 2020 Josh Franco. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController, Storyboarded {
    static var storyboard: Storyboards = .main
    var userService: UserService?
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    @IBAction func logoutBtnPress(_ sender: Any) {
        userService?.logout()
    }
}
