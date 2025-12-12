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
struct StudioGhibliAPI_swift {
    static func main() async throws {
        let films = UrlQuery()
        let container = try await films.getAll(
            endpoint: "films",
            type: Film.self
        )
    }
}
