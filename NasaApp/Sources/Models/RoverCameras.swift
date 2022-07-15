//
//  RoverCameras.swift
//  NasaApp
//
//  Created by Doston Rustamov on 15/07/22.
//

import Foundation

struct Rover {
    enum CameraType: String {
        case FHAZ = "Front Hazard Avoidance Camera"
        case RHAZ = "Rear Hazard Avoidance Camera"
        case MAST = "Mast Camera"
        case CHEMCAM = "Chemistry and Camera Complex"
        case MAHLI = "Mars Hand Lens Imager"
        case MARDI = "Mars Descent Imager"
        case NAVCAM = "Navigation Camera"
        
        static let allCameras = [FHAZ, RHAZ, MAST, CHEMCAM, MAHLI, MARDI, NAVCAM]
    }
    
    struct Photos: Codable {
        var photos: [Photo]
        
        enum CodingKeys: String, CodingKey {
            case photos
        }
    }
    
    struct Photo: Codable {
        var id: Int
        var imageURL: String
        
        enum CodingKeys: String, CodingKey {
            case id
            case imageURL = "img_src"
        }
    }
}
