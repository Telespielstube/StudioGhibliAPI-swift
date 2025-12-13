//
//  Query.swift
//  GhibliAPI-cli
//
//  Created by Marta Brüning on 11.12.25.
//

import Foundation

public protocol Query {

    // Fetches all film from the remote Ghibli database.
    //
    // - Parameters:
    //      endpoint: REST resource where the data is being fetched.
    //
    // Returns: An array of generic Ghibli database objects.
    func getAll<Data: Decodable>(
        endpoint: String,
        type: Data.Type
    ) async throws -> [Data]
}
