//
//  AuthConfigurator.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 26/02/23.
//

import UIKit

struct AuthConfigurator {
    static func createScreen() -> AuthViewController {
        let viewController = AuthViewController()
        let authDelegate = AuthDelegates()
        let router = AuthRouter()
        viewController.router = router
        viewController.authDelegate = authDelegate
        return viewController
    }
}
