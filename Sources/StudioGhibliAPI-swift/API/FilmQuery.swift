//
//  FilmModel.swift
//  GhibliAPI-cli
//
//  Created by Marta Brüning on 11.12.25.
//

import Foundation

@available(macOS 12.0, *)
struct FilmQuery: Query {
    let dataFetcher = DataFetcher()

    func getAll(endpoint: String) async throws -> [Film] {
        return try await dataFetcher.fetchData(url: endpoint, type: [Film].self)
    }

    func filter(endpoint: String, filterByName: String) async throws -> [Film] {
        let content = try await dataFetcher.fetchData(
            url: endpoint,
            type: [Film].self
        )
        return content.filter { $0.title == filterByName }
    }

}
