//
//  ProfileDataSource.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 11/05/23.
//

import Foundation
import UIKit

class ProfileDataSource: NSObject, UITableViewDataSource {
    
    weak var viewController: ProfileViewController?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewController?.model.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let viewController else {return UITableViewCell()}
        cell.selectionStyle = .none
        cell.textLabel?.text = viewController.model[indexPath.row]
        return cell
    }
    
    
}
