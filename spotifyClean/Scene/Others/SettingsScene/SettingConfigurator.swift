//
//  SettingConfigurator.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 11/05/23.
//

import Foundation

struct SettingConfigurator {
    static func createScreen() -> SettingsViewController {
        let vc = SettingsViewController()
        let dataSource = SettingsDataSource()
        let delegate = SettingsDelegates()
        let router = SettingsRouter()
        dataSource.viewController = vc
        delegate.viewController = vc
        router.viewController = vc
        vc.settingRouter = router
        vc.settingsDataSource = dataSource
        vc.settingsDelegate = delegate
        return vc
    }
}
