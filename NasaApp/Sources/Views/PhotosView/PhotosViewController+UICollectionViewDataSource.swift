//
//  PhotoDetailViewController+UICollectionViewDataSource.swift
//  NasaApp
//
//  Created by Doston Rustamov on 15/07/22.
//

import UIKit

extension PhotosViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        coordinator?.showPhotoDetails(with: photos[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if photos.isEmpty {
            emptyLabel.isHidden = false
            return 0
        }
        emptyLabel.isHidden = true
        return photos.count
    }
}
