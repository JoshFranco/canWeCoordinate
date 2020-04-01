//
//  OnboardingCoordinator.swift
//  canWeCoodinate
//
//  Created by Josh Franco on 3/29/20.
//  Copyright © 2020 Josh Franco. All rights reserved.
//

import UIKit

final class OnboardingCoordinator: NSObject, Coordinator, Navigatable {
    var services: SomeServices?
    var parent: Coordinator?
    var children: [Coordinator] = []
    var navigation: ((Route, UIViewController?) -> Void)?
    weak var rootViewController: UIViewController?
    
    weak var tempVC: UIViewController?
    
    enum Route {
        case finish(userName: String, password: String)
    }
    
    func start() {
        print("start")
        
        let credentialsVC = CredentialsViewController.instantiate()
        let navController = UINavigationController(rootViewController: credentialsVC)
        //navController.presentationController?.delegate = self
        
        self.tempVC?.present(navController, animated: true) 
        self.rootViewController = navController
//        credentialsVC.navigation = { result, _ in
//            switch result {
//            case .next(userName: let userName, password: let password):
//                break
//            }
//        }
    }
    
    deinit {
        print("👏\(String(describing: self))👏")
    }
}

//// MARK: - UIAdaptivePresentationControllerDelegate
//extension OnboardingCoordinator: UIAdaptivePresentationControllerDelegate {
//    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
//        self.parent?.removeChild(self)
//    }
//}
