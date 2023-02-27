//
//  WelcomeRouter.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 26/02/23.
//

import UIKit

class WelcomeSceenRouter: NSObject, WelcomeRoutingLogic {
    weak var viewController: WelcomeViewController?
    @objc func navigateToAuthScreen() {
        let vc = AuthConfigurator.createScreen()
        vc.completionHandler = { [weak self] (success) in
            DispatchQueue.main.async {
                self?.handleSignIN(success)
            }
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func handleSignIN(_ success: Bool) {
        if success {
            let vc = TabBarConfigurator.createScene().withdNavigationController()
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .coverVertical
            viewController?.present(vc, animated: true)
        }
    }
}

