//
//  ProfileConfigurator.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 10/05/23.
//

import Foundation

struct ProfileConfigurator {
    static func createScreen() -> ProfileViewController {
        let vc = ProfileViewController()
        let restManager = UserProfileRESTManager()
        let dataSource = ProfileDataSource()
        let delegate = ProfileDelegates()
        dataSource.viewController = vc
        delegate.viewController = vc
        vc.profileDelegate = delegate
        vc.profileDataSource = dataSource
        vc.restManager = restManager
        return vc
    }
}
