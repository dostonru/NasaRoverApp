//
//  Response.swift
//  
//
//  Created by Doston Rustamov on 16/07/22.
//

import Foundation

struct Response: Codable {
    var photos: [Rover.Photo]
    
    enum CodingKeys: String, CodingKey {
        case photos
    }
}
