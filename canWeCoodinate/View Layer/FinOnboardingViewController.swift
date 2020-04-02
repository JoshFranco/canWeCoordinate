//
//  FinOnboardingViewController.swift
//  canWeCoodinate
//
//  Created by Josh Franco on 3/29/20.
//  Copyright © 2020 Josh Franco. All rights reserved.
//

import UIKit

class FinOnboardingViewController: UIViewController, Storyboarded, Navigatable {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    static var storyboard: Storyboards = .onboarding
    var navigation: ((Route, UIViewController?) -> Void)?
    var userName: String?
    var password: String?
    
    enum Route {
        case finish(userName: String, password: String)
    }

    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameLabel.text = userName
        passwordLabel.text = password
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    deinit {
        print("👏\(String(describing: type(of: self)))👏")
    }
    
    // MARK: - Actions
    @IBAction func finishBtnPress(_ sender: Any) {
        guard
            let userName = userNameLabel.text,
            let password = passwordLabel.text else { return }
        
        self.navigate(.finish(userName: userName, password: password))
    }
}
