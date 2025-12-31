//
//  ImageListCell.swift
//  PinImages
//

import UIKit

final class ImagesListCell: UITableViewCell {
    
    // MARK: - Identifiers
    
    static let reuseIdentifier = "ImagesListCell"
    
    // MARK: - Outlets
    
    @IBOutlet var cellImage: UIImageView!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var dateLabel: UILabel!
    
    // MARK: - Setup
    
    func setupImageCornerRaadius(to radius: CGFloat) {
        cellImage.layer.cornerRadius = radius
        cellImage.clipsToBounds = true
    }
}
