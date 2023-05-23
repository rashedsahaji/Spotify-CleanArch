//
//  SettingsRouter.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 11/05/23.
//

import Foundation
import UIKit

class SettingsRouter: SettingsRoutingLogic {
    
    weak var viewController: SettingsViewController?
    
    func navigateToProfile() {
        let vc = ProfileConfigurator.createScreen()
        vc.navigationItem.largeTitleDisplayMode = .never
        guard let viewController else {return}
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}
