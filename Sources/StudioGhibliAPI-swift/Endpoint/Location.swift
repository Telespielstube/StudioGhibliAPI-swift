//
//  Location.swift
//  GhibliAPI-swift
//
//  Created by Marta Brüning on 10.12.25.
//

import Foundation


public struct Location: Codable, Identifiable {
    let id: String
    let name: String
    let climate: String
    let terrain: String
    let surfaceWater: String
    let residents: [String]
    let films: [String]
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, climate, terrain, residents, films, url
        case surfaceWater = "surface_water"
    }
}
