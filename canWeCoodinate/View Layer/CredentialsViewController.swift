//
//  CredentialsViewController.swift
//  canWeCoodinate
//
//  Created by Josh Franco on 3/29/20.
//  Copyright © 2020 Josh Franco. All rights reserved.
//

import UIKit

class CredentialsViewController: UIViewController, Storyboarded, Navigatable {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    static var storyboard: Storyboards = .onboarding
    var navigation: ((Route, UIViewController?) -> Void)?
    
    enum Route {
        case next(userName: String, password: String)
    }
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    deinit {
        print("👏\(String(describing: type(of: self)))👏")
    }
    
    // MARK: - Actions
    @IBAction func nextBtnPress(_ sender: Any) {
        guard
            let userName = userNameTextField.text,
            let password = passwordTextField.text,
            (userNameTextField.text?.count ?? 0) >= 4,
            (passwordTextField.text?.count ?? 0) >= 4 else {
                showAlert()
                return
        }
        
        self.navigate(.next(userName: userName, password: password))
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}

private extension CredentialsViewController {
    func showAlert() {
        let alert = UIAlertController(title: nil,
                                      message: "User Name and/or Password must be 4 chars or greater",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok...", style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
