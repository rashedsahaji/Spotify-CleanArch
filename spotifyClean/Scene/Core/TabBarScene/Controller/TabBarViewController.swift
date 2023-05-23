//
//  TabBarViewController.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 25/02/23.
//

import UIKit

enum IndicatorStatus {
    case start
    case stop
}

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension TabBarViewController {
    private func setupView() {
        tabBar.backgroundColor = .systemBackground.withAlphaComponent(0.9)
        let home = HomeConfigurator.createScreen().withdNavigationController()
        let search = SearchViewController().withdNavigationController()
        let library = LibraryViewController().withdNavigationController()
        
        home.navigationBar.tintColor = .label
        search.navigationBar.tintColor = .label
        library.navigationBar.tintColor = .label
        
        home.tabBarItem = UITabBarItem(title: LocalizedStrings.TabBarVC.home.localized, image: .home, tag: 1)
        search.tabBarItem = UITabBarItem(title: LocalizedStrings.TabBarVC.search.localized, image: .magnifyingglass, tag: 1)
        library.tabBarItem = UITabBarItem(title: LocalizedStrings.TabBarVC.library.localized, image: .musicNote, tag: 1)
        
        setViewControllers([home, search, library].map({ (vc) in
            vc.navigationItem.largeTitleDisplayMode = .always
            vc.navigationBar.prefersLargeTitles = true
            return vc
        }), animated: true)
    }
}
