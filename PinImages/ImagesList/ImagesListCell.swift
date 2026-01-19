//
//  ImageListCell.swift
//  PinImages
//

import UIKit

final class ImagesListCell: UITableViewCell {
    
    // MARK: - Identifiers
    
    static let reuseIdentifier = "ImagesListCell"
    
    // MARK: - Outlets
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    
    // MARK: - Setup
    
    func setupImageCornerRaadius(to radius: CGFloat) {
        cellImage.layer.cornerRadius = radius
        cellImage.clipsToBounds = true
    }
}
