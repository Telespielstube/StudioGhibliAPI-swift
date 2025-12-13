//
//  Location.swift
//  GhibliAPI-swift
//
//  Created by Marta Brüning on 10.12.25.
//

import Foundation

public struct Location: Codable, Identifiable {
    public let id: String
    public let name: String
    public let climate: String
    public let terrain: String
    public let surfaceWater: String
    public let residents: [String]
    public let films: [String]
    public let url: String

    enum CodingKeys: String, CodingKey {
        case id, name, climate, terrain, residents, films, url
        case surfaceWater = "surface_water"
    }
}
