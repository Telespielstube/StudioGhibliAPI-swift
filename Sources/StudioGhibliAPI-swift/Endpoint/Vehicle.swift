//
//  Vehicle.swift
//  GhibliAPI-swift
//
//  Created by Marta Brüning on 10.12.25.
//

import Foundation


struct Vehicle: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
    let vehicleClass: String
    let length: String
    let pilot: String
    let films: [String]
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, description, length, pilot, films, url
        case vehicleClass = "vehicle_class"
    }
}
