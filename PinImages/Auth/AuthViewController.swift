//
//  AuthViewController.swift
//  PinImages
//

import UIKit

final class AuthViewController: UIViewController {
    
    // MARK: - Constants
    
    private let showWebViewSegueIdentifier = "showWebView"
    
    
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
