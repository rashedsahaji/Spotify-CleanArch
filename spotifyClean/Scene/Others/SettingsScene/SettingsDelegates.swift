//
//  SettingsDelegates.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 11/05/23.
//

import Foundation
import UIKit

class SettingsDelegates: NSObject, UITableViewDelegate {
    weak var viewController: SettingsViewController?
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewController else {return}
        
        tableView.deselectRow(at: indexPath, animated: true)
        let model = viewController.section[indexPath.section].options[indexPath.row]
        model.handler()
    }
}
