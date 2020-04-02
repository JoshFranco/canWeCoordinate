//
//  OnboardingCoordinator.swift
//  canWeCoodinate
//
//  Created by Josh Franco on 3/29/20.
//  Copyright © 2020 Josh Franco. All rights reserved.
//

import UIKit

final class OnboardingCoordinator: NSObject, Coordinator, Navigatable {
    var services: ServiceManager?
    var parent: Coordinator?
    var children: [Coordinator] = []
    var navigation: ((Route, UIViewController?) -> Void)?
    weak var rootViewController: UIViewController?
    
    enum Route {
        case finish(userName: String, password: String)
    }
    
    func start() {
        let credentialsVC = CredentialsViewController.instantiate()
        let navController = UINavigationController(rootViewController: credentialsVC)
        navController.presentationController?.delegate = self
        
        self.parent?.rootViewController?.present(navController, animated: true)
        self.rootViewController = navController
        credentialsVC.navigation = { result, _ in
            switch result {
            case .next(let userName, let password):
                self.showFinOnboardingVC(with: userName, and: password)
            }
        }
    }
    
    deinit {
        print("👏\(String(describing: type(of: self)))👏")
    }
}

// MARK: - Private Methods
private extension OnboardingCoordinator {
    func showFinOnboardingVC(with userName: String, and password: String) {
        let finOnboardingVC = FinOnboardingViewController.instantiate()
        finOnboardingVC.userName = userName
        finOnboardingVC.password = password
        
        self.navigate(to: finOnboardingVC) { (result, owner) in
            switch result {
            case .finish(let userName,  let password):
                self.navigate(.finish(userName: userName, password: password))
            }
        }
    }
}

// MARK: - UIAdaptivePresentationControllerDelegate
extension OnboardingCoordinator: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        self.parent?.removeChild(self)
    }
}
