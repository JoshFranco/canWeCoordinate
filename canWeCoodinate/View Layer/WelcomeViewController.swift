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
    var userService: UserService?
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
        print("👏\(String(describing: type(of: self)))👏")
    }
    
    // MARK: - Actions
    @IBAction func loginBtnPress(_ sender: Any) {
        guard
            let userName = nameTextField.text,
            let password = passwordTextField.text else { return }
        
        if userService?.validate(using: userName, and: password) ?? false {
            userService?.logInUser()
            self.navigate(.login)
        } else {
            let alert = UIAlertController(title: nil,
                                          message: "User Name and/or Password is incorrect :(",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok...", style: .destructive, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func signUpBtnPress(_ sender: Any) {
        self.navigate(.signUp)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
