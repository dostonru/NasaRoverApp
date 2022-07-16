//
//  Coordinator.swift
//  NasaApp
//
//  Created by Doston Rustamov on 16/07/22.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
