//
//  Vehicle.swift
//  GhibliAPI-swift
//
//  Created by Marta Brüning on 10.12.25.
//

import Foundation


public struct Vehicle: Codable, Identifiable {
    public let id: String
    public let name: String
    public let description: String
    public let vehicleClass: String
    public let length: String
    public let pilot: String
    public let films: [String]
    public let url: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, description, length, pilot, films, url
        case vehicleClass = "vehicle_class"
    }
}
