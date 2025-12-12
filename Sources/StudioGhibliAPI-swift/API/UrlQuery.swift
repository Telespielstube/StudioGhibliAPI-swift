//
//  FilmModel.swift
//  GhibliAPI-cli
//
//  Created by Marta Brüning on 11.12.25.
//

import Foundation

@available(macOS 12.0, *)
public struct UrlQuery: Query, Filter {
    
    let dataFetcher = DataFetcher()

    public func getAll<Data: Decodable>(endpoint: String, type: Data.Type) async throws -> [Data] {
        return try await dataFetcher.fetchData(url: endpoint, type: [Data].self)
    }
    
    public func filter<T: Equatable>(endpoint: String, filterBy keyPath: KeyPath<Film, T>, value: T) async throws -> [Film] {
        do {
            let jsonContent = try await dataFetcher.fetchData(
                url: endpoint,
                type: [Film].self
            )            
            // The $0 describes the first parameter in this case 'content'
            // --> shorthand closure does not need a return keyword.
            return jsonContent.filter { $0[keyPath: keyPath] == value }
        } catch let error {
            throw ParserError.decodingFailed(underlyingError: error)
        }
                
    }

}
