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

    func filter(endpoint: String, filterBy: String) async throws -> [Film] {
        do {
            let jsonContent = try await dataFetcher.fetchData(
                url: endpoint,
                type: [Film].self
            )
            // The $0 describes the first parameter in this case 'content'
            // --> shorthand closure does not need a return keyword.
            return jsonContent.filter { $0.title == filterByName }
        } catch let error {
            throw ParserError.decodingFailed(
                underlyingError: NSError(
                    domain: "DataFetcher",
                    code: -1,
                    userInfo: [
                        NSLocalizedDescriptionKey:
                            "Decoding Error: \(error)"
                    ]
                )
            )
        }
    }

}
