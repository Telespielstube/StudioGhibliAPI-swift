//
//  File.swift
//  StudioGhibliAPI-swift
//
//  Created by Marta Brüning on 12.12.25.
//

import Foundation

// MARK: - Filter Protocol

public protocol Filter {
    associatedtype Item

    // Filters the received data for the passed 'value' parameter.
    // - Protocols:
    //      Equatable: A type that can be compared for value equality.
    //
    // - Paramters:
    //       endpoint: Resource what to be compared.
    //     filteredBy: KeyPath that accepts a json decoded object
    //                  like Film and a property of the aforementioned object.
    //          value: The value of the comparison. Could be "Spirited Away"
    //
    // - Returns: The equal object.
    public func filter<T: Equatable>(
        endpoint: String,
        filterBy keyPath: KeyPath<Film, T>,
        value: T
    ) async throws -> [Item]
}
