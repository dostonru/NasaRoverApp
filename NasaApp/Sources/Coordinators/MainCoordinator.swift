//
//  MainCoordinator.swift
//  NasaApp
//
//  Created by Doston Rustamov on 16/07/22.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    unowned var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mainViewController = ChooseViewController()
        mainViewController.coordinator = self
        navigationController.pushViewController(mainViewController, animated: false)
    }
    
    func explorePhotos(with photos: [Rover.Photo],title: String, subtitle: String) {
        let photosCoordinator = PhotosCoordinator(navigationController: navigationController)
        photosCoordinator.start(with: photos, title: title, subtitle: subtitle)
        childCoordinators.append(photosCoordinator)
    }
    
}


