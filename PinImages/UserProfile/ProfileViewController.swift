//
//  ProfileViewController.swift
//  PinImages
//

import UIKit

final class ProfileViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak private var profileImageView: UIImageView!
    @IBOutlet weak private var usernameLabel: UILabel!
    @IBOutlet weak private var userStatusLabel: UILabel!
    @IBOutlet weak private var nameAndSurnameLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Private funcs
    
    // MARK: - Actions
    
    @IBAction private func logoutButtonTapped(_ sender: Any) { }
}
