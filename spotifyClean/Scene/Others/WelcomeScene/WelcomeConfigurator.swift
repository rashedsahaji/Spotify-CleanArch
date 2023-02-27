//
//  WelcomeConfigurator.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 26/02/23.
//

import Foundation

struct WelcomeConfigurator {
    static func createScreen() -> WelcomeViewController {
        let viewController = WelcomeViewController()
        let router = WelcomeSceenRouter()
        router.viewController = viewController
        viewController.router = router
        return viewController
    }
}
