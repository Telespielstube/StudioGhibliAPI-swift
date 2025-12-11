//
//  PeopleQuery.swift
//  GhibliAPI-cli
//
//  Created by Marta Brüning on 11.12.25.
//

import Foundation


@available(macOS 12.0, *)
struct PeopleQuery: Query {
    let dataFetcher = DataFetcher()
    
    func getAll(endpoint: String) async throws -> [People] {
        return try await dataFetcher.fetchData(url: endpoint, type: [People].self)
    }
}
