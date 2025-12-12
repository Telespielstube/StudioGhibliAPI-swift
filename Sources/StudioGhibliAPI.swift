// The Swift Programming Language
// https://docs.swift.org/swift-book

//
//  main.swift
//  GhibliAPI-cli
//
//  Created by Marta Brüning on 10.12.25.
//
@available(macOS 12.0, *)
@main
public final class StudioGhibliAPI {    
    let query: UrlQuery

    public init() {
        self.query = UrlQuery(
        )
    }

    // Add methods to interact with the API
    public func getAllFilms() async throws -> [Film] {
        return try await urlQuery.getAll(endpoint: "films", type: Film.self)
    }
    
    public func filterFilms(by keyPath: KeyPath<Film, String>, value: String) async throws -> [Film] {
        return try await urlQuery.filter(endpoint: "films", filterBy: keyPath, value: value)
    }
}
