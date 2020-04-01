//
//  AppCoordinator.swift
//  canWeCoodinate
//
//  Created by Josh Franco on 3/28/20.
//  Copyright © 2020 Josh Franco. All rights reserved.
//

import UIKit

final class AppCoordinator: Coordinator {
    var services: SomeServices?
    var parent: Coordinator?
    var children: [Coordinator] = []
    
    var window: UIWindow?
    var rootViewController: UIViewController? {
        didSet {
            window?.rootViewController = self.rootViewController
            window?.makeKeyAndVisible()
        }
    }
    
    convenience init(within window: UIWindow?, with services: SomeServices?) {
        self.init(with: services)
        
        self.window = window
    }
    
    func start() {
//        let tabBarCoord = TabBarCoordinator(within: window, with: services)
//        self.addChild(tabBarCoord)
//        tabBarCoord.start()
        startWelcomeVC()
        
    }
}

private extension AppCoordinator {
    func startWelcomeVC() {
        let welcomeVC = WelcomeViewController.instantiate()
        self.rootViewController = welcomeVC
        welcomeVC.navigation = { result, _ in
            switch result {
            case .login:
                break
            case .signUp:
                self.startOnboardingCoord()
            }
        }
    }
    
    func startOnboardingCoord() {
        let onboardingCood = OnboardingCoordinator(with: services)
        //self.addChild(onboardingCood)
        onboardingCood.tempVC = rootViewController
        //onboardingCood.start()
        onboardingCood.start { result, _ in
            switch result {
            case .finish(userName: let userName, password: let password):
                break
            }
        }
        
    }
}
