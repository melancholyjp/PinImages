//
//  AuthViewController.swift
//  PinImages
//

import UIKit

final class AuthViewController: UIViewController {
    
    // MARK: - Constants
    
    private let showWebViewSegueIdentifier = "showWebView"
    private let oauth2Service = OAuth2Service.shared
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBackButton()
    }
    
    // MARK: - Configure methods
    
    private func configureBackButton() {
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "navbarBackIcon")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "navbarBackIcon")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = UIColor(named: "YP Black (iOS)")
    }
}

extension AuthViewController: WEbViewViewControllerDelegate {
    func webViewViewController(_ vc: WebViewViewController, didAuthenticateWithCode code: String) {
        DispatchQueue.main.async { [self] in
            oauth2Service.fetchOAuthToken(code: code, completion: { [weak self, weak vc] result in
                guard let self else { return }
                guard let vc else { return }
                
                switch result {
                case .success(let token):
                    vc.dismiss(animated: true)
                    
                case .failure(let error):
                    print("Error: \(error)")
                    vc.dismiss(animated: true)
                }
            })
        }
    }
    
    func webViewViewControllerDidCancel(_ vc: WebViewViewController) {
        vc.dismiss(animated: true)
    }
    
    
}
