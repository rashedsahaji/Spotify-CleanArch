//
//  AuthDelegates.swift
//  spotifyClean
//
//  Created by Rashed Sahajee on 26/02/23.
//

import UIKit
import WebKit

class AuthDelegates: NSObject, WKNavigationDelegate {
    
    // MARK: - Properties
    weak var delegate: AuthSuccessDelegate?
    
    // MARK: - Extract Access Token
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
        guard let url = webView.url else { return }
        let componnet = URLComponents(url: url, resolvingAgainstBaseURL: true)
        guard let code = componnet?.queryItems?.first(where: {$0.name == "code"})?.value else {return}
        debugPrint(code)
        webView.isHidden = true
        Task {
            let succes = await AuthManager.shared.exchangeCodeForToken(code: code)
            delegate?.tokenSavedSuccessfully(result: succes)
        }
    }
}
