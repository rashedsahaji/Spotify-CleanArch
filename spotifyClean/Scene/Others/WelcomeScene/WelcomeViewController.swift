//
//  WelcomeViewController.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 26/02/23.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - Component
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle(LocalizedStrings.WelcomeScreen.buttonTitle.localized, for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    // MARK: - Properties
    var router: WelcomeRoutingLogic?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addButtonTargets()
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addAutoLayoutToComponent()
    }
}


// MARK: - Helping Methods
extension WelcomeViewController {
    private func setupView() {
        title = LocalizedStrings.ScreenTitle.singIn.localized
        view.backgroundColor = .systemGreen
        view.addSubview(signInButton)
    }
    
    private func addAutoLayoutToComponent() {
        signInButton.frame = CGRectMake(20, view.height-50 - view.safeAreaInsets.bottom, view.width-40, 50)
    }
    private func addButtonTargets() {
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
    }
    
    @objc func didTapSignIn(_ sender: UIButton) {
        router?.navigateToAuthScreen()
    }
}
