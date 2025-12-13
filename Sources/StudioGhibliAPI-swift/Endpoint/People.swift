//
//  People.swift
//  GhibliAPI-swift
//
//  Created by Marta Brüning on 10.12.25.
//

import Foundation

public struct People: Codable, Identifiable {
    public let id: String
    public let name: String
    public let gender: String
    public let age: String
    public let eyeColor: String
    public let hairColor: String
    public let films: [String]
    public let species: String
    public let url: String

    enum CodingKeys: String, CodingKey {
        case id, name, gender, age, films, species, url
        case eyeColor = "eye_color"
        case hairColor = "hair_color"
    }
}
