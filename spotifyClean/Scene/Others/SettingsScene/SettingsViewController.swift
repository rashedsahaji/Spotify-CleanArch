//
//  SettingsViewController.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 11/05/23.
//

import UIKit

class SettingsViewController: UIViewController {
    
    //MARK: - UIComponents
    private let tableView: UITableView = {
        let uitableView = UITableView(frame: .zero, style: .grouped)
        uitableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return uitableView
    }()

    // MARK: - LifeCycleMethods
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        view.backgroundColor = .systemBackground
        setupTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    // MARK: - Properties
    var settingsDelegate: SettingsDelegates?
    var settingsDataSource: SettingsDataSource?
    var settingRouter: SettingsRoutingLogic?
    
    var section = [Section]()

}

// MARK: - UISetup
extension SettingsViewController {
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = settingsDelegate
        tableView.dataSource = settingsDataSource
        configureModel()
    }
    
    private func configureModel() {
        section.append(Section(title: "Profile", options: [Option(title: "View Your Profile", handler: { [weak self] in
            guard let self else {return}
            DispatchQueue.main.async {
                self.viewProfile()
            }
        })]))
        section.append(Section(title: "Account", options: [Option(title: "SignOut", handler: { [weak self] in
            guard let self else {return}
            DispatchQueue.main.async {
                self.singOut()
            }
        })]))

    }
    
    private func viewProfile() {
        guard let settingRouter else {return}
        settingRouter.navigateToProfile()
    }
    
    private func singOut() {
    }
}
