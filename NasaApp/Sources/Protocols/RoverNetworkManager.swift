//
//  RoverNetworkManager.swift
//  NasaApp
//
//  Created by Doston Rustamov on 16/07/22.
//

protocol RoverNetworkManager {
    
    func fetchImages(
        from camera: Rover.CameraType,
        at date: String,
        completion: @escaping (Result<[Rover.Photo], Error>) -> Void
    )
    
}
