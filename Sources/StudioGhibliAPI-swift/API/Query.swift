//
//  Query.swift
//  GhibliAPI-cli
//
//  Created by Marta Brüning on 11.12.25.
//

import Foundation

protocol Query {
    associatedtype Data

    func getAll(endpoint: String) async throws -> [Data]
    
}
