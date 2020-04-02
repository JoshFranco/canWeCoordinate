//
//  FirstCoordinator.swift
//  canWeCoodinate
//
//  Created by Josh Franco on 3/29/20.
//  Copyright © 2020 Josh Franco. All rights reserved.
//

import UIKit

final class FirstCoordinator: Coordinator {
    var services: ServiceManager?
    var parent: Coordinator?
    var children: [Coordinator] = []
    var rootViewController: UIViewController?
    
    convenience init(using root: UIViewController?, and services: ServiceManager?) {
        self.init(with: services)
        self.rootViewController = root
    }
    
    func start() {
        // do stuff
    }
    
    deinit {
        print("👏\(String(describing: type(of: self)))👏")
    }
}
