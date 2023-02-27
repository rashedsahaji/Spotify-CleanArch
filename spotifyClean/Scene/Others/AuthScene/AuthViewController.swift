//
//  AuthViewController.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 26/02/23.
//

import UIKit
import WebKit

class AuthViewController: UIViewController {
    
    // MARK: - Component
    private let webView: WKWebView = {
        let pref = WKWebpagePreferences()
        pref.allowsContentJavaScript = true
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = pref
        let webView = WKWebView(frame: .zero, configuration: config)
        return webView
    }()
    
    // MARK: - Handlers
    public var completionHandler: ((_ with: Bool) -> Void)?
    
    
    // MARK: - Properties
    var authDelegate: AuthDelegates?
    var router: AuthRoutingLogic?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }

}

// MARK: - Helping Methods
extension AuthViewController {
    private func setupView() {
        view.addSubview(webView)
        dispalyWebView()
    }
    
    private func dispalyWebView() {
        authDelegate?.delegate = self
        webView.navigationDelegate = self.authDelegate
        do {
            let authURL = try APIManager.shared.createRquest(from: AuthEndPoint.login)
            webView.load(authURL)
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
}

// MARK: - Handler Delegate
extension AuthViewController : AuthSuccessDelegate {
    func tokenSavedSuccessfully(result: Bool) {
        guard result else {
            let alert = UIAlertController(title: "Ooops", message: "Something Went Wrong", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
            present(alert, animated: true)
            return
        }
        DispatchQueue.main.async { [weak self] in
            self?.navigationController?.popToRootViewController(animated: true)
            self?.completionHandler?(result)
        }
    }
}

class aAu: AuthViewController {
    
}
