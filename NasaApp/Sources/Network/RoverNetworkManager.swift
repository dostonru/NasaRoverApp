//
//  RoverNetworkManager.swift
//  NasaApp
//
//  Created by Doston Rustamov on 15/07/22.
//

import Foundation
import Alamofire

class RoverNetworkManager {
    
    static let instance = RoverNetworkManager()
    
    struct Constants {
        static let apiKey = "MKjkqRBKMSLQxBfCIUFcFUxhVjhK3Q3m3HnXVB3w"
        static let baseURL = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?api_key=".appending(Constants.apiKey)
    }

    func fetchImages(
        from camera: Rover.CameraType,
        at date: String,
        completion: @escaping (Result<[Rover.Photo], Error>) -> Void
    ) {
        let fullURL = Constants.baseURL + "&camera=\(camera)&earth_date=\(date)"
        
        AF.request(fullURL, method: .get).responseDecodable(of: Rover.Photos.self) { response in
            guard let photos = response.value else {
                completion(.failure(response.error!))
                return
            }
            completion(.success(photos.photos))
        }
    }
}
