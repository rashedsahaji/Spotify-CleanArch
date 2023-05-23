//
//  ProfileViewController.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 10/05/23.
//

import UIKit
import Foundation

class ProfileViewController: UIViewController {
    
    var restManager: UserProfileRESTManager?
    
 // MARK: - Components
    
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.isHidden = true
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tv
    }()
    
    
// MARK: - LifeCycle Methods
    override func viewDidLoad() {
        title = "Profile"
        view.backgroundColor = .systemBackground
        setupTableView()
        Task {
            guard let restManager else {return}
             let user = await restManager.getUserProfile()
            DispatchQueue.main.async { [weak self] in
                guard let user else {
                    self?.failedToGetProfile()
                    return
                }
                self?.updateUI(with: user)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    // MARK: - Properties
    var profileDelegate: ProfileDelegates?
    var profileDataSource: ProfileDataSource?
    var model = [String]()

}

// MARK: - UISetup
extension ProfileViewController {
    
    private func setupTableView() {
        view.addSubview(tableView)
    }
    
    private func updateUI(with model: UserProfile) {
        tableView.delegate = profileDelegate
        tableView.dataSource = profileDataSource
        tableView.isHidden = false
        self.model.append("Full Name: \(model.displayName ?? "" )")
        self.model.append("Email Address: \(model.email ?? "" )")
        self.model.append("User Id: \(model.id ?? "" )")
        self.model.append("Plan: \(model.product ?? "")")
        createTableHeader(with: model.images?.first?.url)
        tableView.reloadData()
    }
    
    private func createTableHeader(with string: String?) {
        guard let string else {return}
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: view.width/1.5))
        let imageSize: CGFloat = headerView.height/2
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: imageSize, height: imageSize))
        headerView.addSubview(imageView)
        imageView.center = headerView.center
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageSize / 2
        imageView.setImage(with: string)
        tableView.tableHeaderView = headerView
    }
    
    private func failedToGetProfile() {
        let label = UILabel(frame: .zero)
        label.text = "Failed to load profile"
        label.sizeToFit()
        label.textColor = .secondaryLabel
        view.addSubview(label)
        label.center = view.center
    }
    
}
