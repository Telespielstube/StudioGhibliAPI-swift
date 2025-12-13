//
//  Spiecies.swift
//  GhibliAPI-swift
//
//  Created by Marta Brüning on 10.12.25.
//

import Foundation


public struct Species: Codable, Identifiable {
    public let id: String
    public let name: String
    public let classification: String
    public let eyeColors: String
    public let hairColors: String
    public let people: [String]
    public let films: [String]
    public let url: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, classification, people, films, url
        case hairColors = "hair_colors"
        case eyeColors = "eye_colors"
    }
}
