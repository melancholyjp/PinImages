//
//  ProfileViewController.swift
//  PinImages
//

import UIKit

final class ProfileViewController: UIViewController {
    
    // MARK: - Properties
    
    private enum Constants {
        static let leadingInset: CGFloat = 16
        static let topInsetForImage: CGFloat = 32
        static let spacingInset: CGFloat = 8
        static let trailingInset: CGFloat = -16
        static let logoutButtonHeight: CGFloat = 44
        static let logoutButtonWidth: CGFloat = 44
        static let imageHeight: CGFloat = 70
        static let imageWidth: CGFloat = 70
        static let highFontSize: CGFloat = 23
        static let normalFontSize: CGFloat = 13
    }
    
    // MARK: - Outlets
    
    private var profileImageView: UIImageView?
    private var nameAndSurnameLabel: UILabel?
    private var usernameLabel: UILabel?
    private var statusLabel: UILabel?
    private var logoutButton: UIButton?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewsAndConstraints()
    }
    
    // MARK: - Setup Views
    
    private func setupViewsAndConstraints() {
        profileImageView = createProfileImageView()
        nameAndSurnameLabel = createNameAndSurnameLabel()
        usernameLabel = createUsernameLabel()
        statusLabel = createStatusLabel()
        logoutButton = createLogoutButton()
        
        guard let profileImageView,
              let nameAndSurnameLabel,
              let usernameLabel,
              let statusLabel,
              let logoutButton else { return }
            
        [profileImageView, nameAndSurnameLabel, usernameLabel, statusLabel, logoutButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        setupConstraints(
            profileImageView: profileImageView,
            nameAndSurnameLabel: nameAndSurnameLabel,
            usernameLabel: usernameLabel,
            statusLabel: statusLabel,
            logoutButton: logoutButton
        )
    }
    
    private func setupConstraints(
        profileImageView: UIView,
        nameAndSurnameLabel: UILabel,
        usernameLabel: UILabel,
        statusLabel: UILabel,
        logoutButton: UIButton
    ) {
        NSLayoutConstraint.activate([
            // profileImageView
            
            profileImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.leadingInset),
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.topInsetForImage),
            profileImageView.widthAnchor.constraint(equalToConstant: Constants.imageWidth),
            profileImageView.heightAnchor.constraint(equalToConstant: Constants.imageHeight),
            
            // nameAndSurnameLabel
            
            nameAndSurnameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.leadingInset),
            nameAndSurnameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: Constants.spacingInset),
            
            // usernameLabel
            
            usernameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.leadingInset),
            usernameLabel.topAnchor.constraint(equalTo: nameAndSurnameLabel.bottomAnchor, constant: Constants.spacingInset),
            
            // statusLabel
            
            statusLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.leadingInset),
            statusLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: Constants.spacingInset),
            
            // logoutButton
            
            logoutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Constants.trailingInset),
            logoutButton.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            logoutButton.heightAnchor.constraint(equalToConstant: Constants.logoutButtonHeight),
            logoutButton.widthAnchor.constraint(equalToConstant: Constants.logoutButtonWidth)
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
        nameAndSurnameLabel.font = UIFont.systemFont(ofSize: Constants.highFontSize, weight: .bold)
        nameAndSurnameLabel.textColor = UIColor(named: "YP White (iOS)")
        
        return nameAndSurnameLabel
    }
    
    private func createUsernameLabel() -> UILabel {
        let usernameLabel = UILabel()
        
        usernameLabel.text = "@ekateina_nov"
        usernameLabel.font = UIFont.systemFont(ofSize: Constants.normalFontSize, weight: .regular)
        usernameLabel.textColor = UIColor(named: "YP Gray (iOS)")
        
        return usernameLabel
    }
    
    private func createStatusLabel() -> UILabel {
        let statusLabel = UILabel()
        
        statusLabel.text = "Hello, world!"
        statusLabel.font = UIFont.systemFont(ofSize: Constants.normalFontSize, weight: .regular)
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
