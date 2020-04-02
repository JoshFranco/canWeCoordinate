//
//  AppCoordinator.swift
//  canWeCoodinate
//
//  Created by Josh Franco on 3/28/20.
//  Copyright © 2020 Josh Franco. All rights reserved.
//

import UIKit

final class AppCoordinator: Coordinator {
    var services: ServiceManager?
    var parent: Coordinator?
    var children: [Coordinator] = []
    
    var window: UIWindow?
    var rootViewController: UIViewController? {
        didSet {
            window?.rootViewController = self.rootViewController
            window?.makeKeyAndVisible()
        }
    }
    
    convenience init(within window: UIWindow?, with services: ServiceManager?) {
        self.init(with: services)
        
        self.window = window
    }
    
    func start() {
        if services?.userService.isUserLoggedIn ?? false {
            startTabBarCoord()
        } else {
            startWelcomeVC()
        }
        
    }
}

private extension AppCoordinator {
    func startWelcomeVC() {
        let welcomeVC = WelcomeViewController.instantiate()
        self.rootViewController = welcomeVC
        welcomeVC.userService = services?.userService
        welcomeVC.navigation = { result, owner in
            switch result {
            case .login:
                self.startTabBarCoord()
            case .signUp:
                self.startOnboardingCoord()
            }
        }
    }
    
    func startOnboardingCoord() {
        let onboardingCood = OnboardingCoordinator(with: services)
        self.addChild(onboardingCood)
        onboardingCood.start { result, coord in
            switch result {
            case .finish(let userName, let password):
                self.services?.userService.signUpUser(with: userName, and: password)
                self.removeChild(coord)
                self.start()
            }
        }
    }
    
    func startTabBarCoord() {
        let tabBarCoord = TabBarCoordinator(within: window, with: services)
        self.addChild(tabBarCoord)
        tabBarCoord.start { (result, coord) in
            switch result {
            case .logout:
                self.services?.userService.logout()
                self.removeChild(coord)
                self.start()
            }
        }
    }
}
