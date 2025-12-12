//
//  Spiecies.swift
//  GhibliAPI-swift
//
//  Created by Marta Brüning on 10.12.25.
//

import Foundation


public struct Species: Codable, Identifiable {
    let id: String
    let name: String
    let public classification: String
    let eyeColors: String
    let hairColors: String
    let people: [String]
    let films: [String]
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, public classification, people, films, url
        case hairColors = "hair_colors"
        case eyeColors = "eye_colors"
    }
}
