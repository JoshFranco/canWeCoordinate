//
//  WelcomeViewController.swift
//  canWeCoodinate
//
//  Created by Josh Franco on 3/29/20.
//  Copyright © 2020 Josh Franco. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, Storyboarded, Navigatable {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    static var storyboard: Storyboards = . welcome
    var navigation: ((Route, UIViewController?) -> Void)?
    
    enum Route {
        case login
        case signUp
    }
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    deinit {
        print("👏\(String(describing: self))👏")
    }
    
    // MARK: - Actions
    @IBAction func loginBtnPress(_ sender: Any) {
        self.navigate(.login)
    }
    
    @IBAction func signUpBtnPress(_ sender: Any) {
        self.navigate(.signUp)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
