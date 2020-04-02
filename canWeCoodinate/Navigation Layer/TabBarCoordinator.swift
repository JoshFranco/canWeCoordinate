//
//  TabBarCoordinator.swift
//  canWeCoodinate
//
//  Created by Josh Franco on 3/29/20.
//  Copyright © 2020 Josh Franco. All rights reserved.
//

import UIKit

final class TabBarCoordinator: Coordinator, Navigatable {
    var services: ServiceManager?
    var parent: Coordinator?
    var children: [Coordinator] = []
    
    var window: UIWindow?
    var navigation: ((Route, UIViewController?) -> Void)?
    weak var rootViewController: UIViewController? {
        didSet {
            window?.rootViewController = self.rootViewController
            window?.makeKeyAndVisible()
        }
    }
    
    enum Route {
        case logout
    }
    
    convenience init(within window: UIWindow?, with services: ServiceManager?) {
        self.init(with: services)
        
        self.window = window
    }
    
    func start() {
        let firstVC = LandingViewController.instantiate()
        firstVC.userService = services?.userService
        firstVC.tabBarItem = UITabBarItem(title: "Land to Me", image: nil, selectedImage: nil)
        let firstCoord = FirstCoordinator(using: firstVC, and: services)
        
        let tabBar = UITabBarController()
        tabBar.viewControllers = [firstVC]
        self.addChildren([firstCoord])
        self.rootViewController = tabBar
    }
    
    deinit {
        print("👏\(String(describing: type(of: self)))👏")
    }
}
