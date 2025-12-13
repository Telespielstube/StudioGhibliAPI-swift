//
//  Film.swift
//  GhibliAPI-swift
//
//  Created by Marta Brüning on 10.12.25.
//

import Foundation

/// Codable is a typealias that can encode & decode itself from an external representation
public struct Film: Codable, Identifiable {
    public let id: String
    public let title: String
    public let originalTitle: String
    public let originalTitleRomanised: String
    public let description: String
    public let producer: String
    public let releaseDate: String
    public let runningTime: String
    public let rtScore: String
    public let people: [String]
    public let species: [String]
    public let locations: [String]
    public let vehicles: [String]
    public let url: String

    enum CodingKeys: String, CodingKey {
        case id, title, description, producer, people, species, locations,
            vehicles, url
        case originalTitle = "original_title"
        case originalTitleRomanised = "original_title_romanised"
        case releaseDate = "release_date"
        case runningTime = "running_time"
        case rtScore = "rt_score"
    }
}
