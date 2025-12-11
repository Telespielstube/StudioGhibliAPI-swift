//
//  SpeciesQuery.swift
//  GhibliAPI-cli
//
//  Created by Marta Brüning on 11.12.25.
//

import Foundation

@available(macOS 12.0, *)
struct SpeciesQuery: Query {
    let dataFetcher = DataFetcher()
    
    func getAll(endpoint: String) async throws -> [Species] {
        return try await dataFetcher.fetchData(url: endpoint, type: [Species].self)
    }
}
