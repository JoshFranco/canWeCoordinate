//
//  TabBarCoordinator.swift
//  canWeCoodinate
//
//  Created by Josh Franco on 3/29/20.
//  Copyright © 2020 Josh Franco. All rights reserved.
//

import UIKit

final class TabBarCoordinator: Coordinator {
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
        let firstVC = LandingViewController.instantiate()
        firstVC.tabBarItem = UITabBarItem(title: "Land to Me", image: nil, selectedImage: nil)
        let firstCoord = FirstCoordinator(using: firstVC, and: services)
        
        let tabBar = UITabBarController()
        tabBar.viewControllers = [firstVC]
        self.addChildren([firstCoord])
        self.rootViewController = tabBar
    }
    
    deinit {
        print("👏\(String(describing: self))👏")
    }
}
