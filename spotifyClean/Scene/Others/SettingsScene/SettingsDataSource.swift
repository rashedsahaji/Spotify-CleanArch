//
//  SettingsDataSource.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 11/05/23.
//

import Foundation
import UIKit

class SettingsDataSource: NSObject, UITableViewDataSource {
    
    weak var viewController: SettingsViewController?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let viewController else {return 1}
        return viewController.section.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewController else {return 1}
        return viewController.section[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewController else {return UITableViewCell()}
        let model = viewController.section[indexPath.section].options[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let viewController else {return nil}
        let model = viewController.section[section]
        return model.title
    }
}
