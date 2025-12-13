//
//  FilmModel.swift
//  GhibliAPI-cli
//
//  Created by Marta Brüning on 11.12.25.
//

import Foundation

@available(macOS 12.0, *)
public struct UrlQuery<DataType: Decodable>: Query, Filter {
    public typealias Item = DataType
    public typealias Object = DataType
    
    public init() {}

    public static func getAll<Data: Decodable>(endpoint: String, type: Data.Type)
        async throws -> [Data]
    {
        let dataFetcher = DataFetcher()
        do {
            let jsonContent = try await dataFetcher.fetchData(url: endpoint, type: [Data].self)
            return jsonContent
        } catch let error {
            throw ParserError.decodingFailed(underlyingError: error)
        }
    }

    public static func filter<T: Equatable>(
        endpoint: String,
        filterBy keyPath: KeyPath<Object, T>,
        value: T
    ) async throws -> [Item] {
        let dataFetcher = DataFetcher()
        do {
            let jsonContent = try await dataFetcher.fetchData(
                url: endpoint,
                type: [DataType].self
            )
            // The $0 describes the first parameter in this case 'content'
            // --> shorthand closure does not need a return keyword.
            return jsonContent.filter { $0[keyPath: keyPath] == value }
        } catch let error {
            throw ParserError.decodingFailed(underlyingError: error)
        }

    }

}
