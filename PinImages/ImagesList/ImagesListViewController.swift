//
//  ViewController.swift
//  PinImages
//

import UIKit

final class ImagesListViewController: UIViewController {
    
    // MARK: - Constants
    
    private let showSingleImageSegueIdentifier = "ShowSingleImage"
    
    // MARK: - Outlets
    
    @IBOutlet weak private var tableView: UITableView!
    
    // MARK: - Properties
    
    private enum constants {
        static let photosCount = 20
    }
    
    private let photosNames: [String] = Array(0..<constants.photosCount).map(String.init)
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    // MARK: - Segue prepering
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == showSingleImageSegueIdentifier {
            guard
                let viewController = segue.destination as? SingleImageViewController,
                let indexPath = sender as? IndexPath
            else {
                assertionFailure("Invalid segue destination")
                return
            }
            
            let image = UIImage(named: photosNames[indexPath.row])
            viewController.image = image
        } else {
            super.prepare(for: segue, sender: sender)   
        }
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearance()
        setupTableViewInsets()
    }
    
    // MARK: - Setup
    
    private func setupAppearance() {
        let backgroundColor = UIColor(named: "YP Black (iOS)")
        view.backgroundColor = backgroundColor
        tableView.backgroundColor = backgroundColor
    }
    
    private func setupTableViewInsets() {
        tableView.contentInset = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
    }
}

// MARK: - CellConfiguration

extension ImagesListViewController {
    func configCell(for cell: ImagesListCell, with indexPath: IndexPath) {
        guard let image = UIImage(named: photosNames[indexPath.row]) else {
            return
        }
        
        cell.cellImage.image = image
        cell.dateLabel.text = dateFormatter.string(from: Date())
        
        let isLiked = indexPath.row % 2 == 0
        let likeImage = isLiked ? UIImage(named: "LikeButtonActive") : UIImage(named: "LikeButtonInactive")
        cell.likeButton.setImage(likeImage, for: .normal)
        
        cell.setupImageCornerRaadius(to: 16)
    }
}

// MARK: - UITableViewDelegate

extension ImagesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let image = UIImage(named: photosNames[indexPath.row]) else {
            return 0
        }
            
        let imageInsets = UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16)
        let imageViewWidth = tableView.bounds.width - imageInsets.left - imageInsets.right
        let imageWidth = image.size.width
        let scale = imageViewWidth / imageWidth
        let cellHeight = image.size.height * scale + imageInsets.top + imageInsets.bottom
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: showSingleImageSegueIdentifier, sender: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITableviewDataSource

extension ImagesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photosNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImagesListCell.reuseIdentifier, for: indexPath)
        
        guard let imageListCell = cell as? ImagesListCell else {
            return UITableViewCell()
        }
        
        configCell(for: imageListCell, with: indexPath)
        
        return imageListCell
    }
}
