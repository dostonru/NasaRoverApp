//
//  ImageCollectionViewCell.swift
//  NasaApp
//
//  Created by Doston Rustamov on 15/07/22.
//

import UIKit
import AlamofireImage

class ImageCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "IMAGE_CELL_ID"
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "defaultImage")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    func setupWith(imageURL: String) {
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        contentView.addSubview(imageView)
        imageView.frame = contentView.bounds
        
        guard let url = URL(string: imageURL) else {
            return
        }
        
        imageView.af.setImage(withURL: url)
    }
}
