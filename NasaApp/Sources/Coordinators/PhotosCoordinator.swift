//
//  PhotosCoordinator.swift
//  NasaApp
//
//  Created by Doston Rustamov on 16/07/22.
//

import UIKit

class PhotosCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    unowned var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {

    }
    
    func start(with photos: [Rover.Photo],title: String, subtitle: String) {
        let photosViewController = PhotosViewController(photos: photos,title: title, subtitle: subtitle)
        photosViewController.coordinator = self
        navigationController.pushViewController(photosViewController, animated: true)
    }
    
    func showPhotoDetails(with photo: Rover.Photo) {
        let photoDetailViewController = PhotoDetailViewController(photo: photo)
        navigationController.pushViewController(photoDetailViewController, animated: true)
    }
    
}
