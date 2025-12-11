//
//  Film.swift
//  GhibliAPI-swift
//
//  Created by Marta Brüning on 10.12.25.
//

import Foundation

/// Codable is a typealias that can encode & decode itself from an external representation
struct Film: Codable, Identifiable {
    let id: String
    let title: String
    let originalTitle: String
    let originalTitleRomanised: String
    let description: String
    let producer: String
    let releaseDate: String
    let runningTime: String
    let rtScore: String
    let people: [String]
    let species: [String]
    let locations: [String]
    let vehicles: [String]
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, description, producer, people, species, locations, vehicles, url
        case originalTitle = "original_title"
        case originalTitleRomanised = "original_title_romanised"
        case releaseDate = "release_date"
        case runningTime = "running_time"
        case rtScore = "rt_score"
    }
}
