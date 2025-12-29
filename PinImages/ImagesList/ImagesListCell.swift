//
//  ImageListCell.swift
//  PinImages
//

import UIKit

final class ImagesListCell: UITableViewCell {
    static let reuseIdentifier = "ImagesListCell"
    
    @IBOutlet var cellImage: UIImageView!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var dateLabel: UILabel!
    
    func setupImageCornerRaadius(to radius: CGFloat) {
        cellImage.layer.cornerRadius = radius
        cellImage.clipsToBounds = true
    }
}
