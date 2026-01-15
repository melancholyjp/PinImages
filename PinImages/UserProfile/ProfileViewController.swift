//
//  ProfileViewController.swift
//  PinImages
//

import UIKit

final class ProfileViewController: UIViewController {
    
    // MARK: - Outlets
    
    private var profileImageView: UIImageView!
    private var nameAndSurnameLabel: UILabel!
    private var usernameLabel: UILabel!
    private var statusLabel: UILabel!
    private var logoutButton: UIButton!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    // MARK: - Setup Views
    
    private func setupViews() {
        profileImageView = createProfileImageView()
        nameAndSurnameLabel = createNameAndSurnameLabel()
        usernameLabel = createUsernameLabel()
        statusLabel = createStatusLabel()
        logoutButton = createLogoutButton()
            
        [profileImageView, nameAndSurnameLabel, usernameLabel, statusLabel, logoutButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // profileImageView
            
            profileImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            profileImageView.widthAnchor.constraint(equalToConstant: 70),
            profileImageView.heightAnchor.constraint(equalToConstant: 70),
            
            // nameAndSurnameLabel
            
            nameAndSurnameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            nameAndSurnameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 8),
            
            // usernameLabel
            
            usernameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            usernameLabel.topAnchor.constraint(equalTo: nameAndSurnameLabel.bottomAnchor, constant: 8),
            
            // statusLabel
            
            statusLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            statusLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 8),
            
            // logoutButton
            
            logoutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            logoutButton.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            logoutButton.heightAnchor.constraint(equalToConstant: 44),
            logoutButton.widthAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func createProfileImageView() -> UIImageView {
        guard let image = UIImage(named: "testProfileImage") else {
            return UIImageView()
        }
        
        let imageView = UIImageView(image: image)
        imageView.tintColor = .gray
        
        return imageView
    }
    
    private func createNameAndSurnameLabel() -> UILabel {
        let nameAndSurnameLabel = UILabel()
        
        nameAndSurnameLabel.text = "Екатерина Новикова"
        nameAndSurnameLabel.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        nameAndSurnameLabel.textColor = UIColor(named: "YP White (iOS)")
        
        return nameAndSurnameLabel
    }
    
    private func createUsernameLabel() -> UILabel {
        let usernameLabel = UILabel()
        
        usernameLabel.text = "@ekateina_nov"
        usernameLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        usernameLabel.textColor = UIColor(named: "YP Gray (iOS)")
        
        return usernameLabel
    }
    
    private func createStatusLabel() -> UILabel {
        let statusLabel = UILabel()
        
        statusLabel.text = "Hello, world!"
        statusLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        statusLabel.textColor = UIColor(named: "YP White (iOS)")
        
        return statusLabel
    }
    
    private func createLogoutButton() -> UIButton {
        let logoutButton = UIButton.systemButton(
            with: UIImage(named: "LogoutIcon")!,
            target: self,
            action: #selector(Self.logoutButtonTapped)
        )
        
        logoutButton.tintColor = UIColor(named: "YP Red (iOS)")
        
        return logoutButton
    }
    
    // MARK: - Actions
    @objc private func logoutButtonTapped() {}
}
