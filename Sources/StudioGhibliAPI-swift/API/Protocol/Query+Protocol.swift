//
//  Query.swift
//  GhibliAPI-cli
//
//  Created by Marta Brüning on 11.12.25.
//

import Foundation

protocol Query {
    associatedtype Data

    // Fetches all film from the remote Ghibli database.
    //
    // - Parameters:
    //      endpoint: REST resource where the data is being fetched.
    //
    // Returns: An array of generic Ghibli database objects.
    func getAll(endpoint: String) async throws -> [Data]
    
    // It filters the fetched Film array by the passed filterBy parameter.
    //
    // - Parameters:
    //          endpoint : The resource the data is being fetched from the Ghibli database.
    //          filterBy : The condition the data is being filtered.
    //          value    : The value to compare the data to.
    //
    // - Returns: An array of generic objects.
    //
    // - Throws:
    //      ParserError: Is thrown if a parsing error occurs.
    func filter<T: Equatable>(endpoint: String, filterBy keyPath: KeyPath<Data, T>, value: T) async throws -> [Data]
}
