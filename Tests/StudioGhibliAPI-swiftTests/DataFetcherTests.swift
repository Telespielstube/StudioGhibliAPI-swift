//
//  Test.swift
//  StudioGhibliAPI-swift
//
//  Created by Marta Brüning on 11.12.25.
//

import Testing
@testable import StudioGhibliAPI_swift

public struct DataFetcherTests {
    init() async throws {}
    
    @Test func testIfFilmGetFetched() async throws {
        let dataFetcher = DataFetcher()
        
        let films: [Film] = try await dataFetcher.fetchData(
            url: "films",
            type: [Film].self
        )
        
        #expect(!films.isEmpty)
    }
    
    @Test func testIfURLBuildThrowsbadURLResponseWhenWrongResourceIsPassed() async throws
    {
        let dataFetcher = DataFetcher()

        await #expect(throws: (NetworkError.badURLResponse).self) {
            try await dataFetcher.fetchData(
                url: "marta",
                type: Film.self
            )
        }
    }

    @Test func testIfURLBuildThrowsInvalidURLWhenEmptyResourceIsPassed() async throws
    {
        let dataFetcher = DataFetcher()

        await #expect(throws: NetworkError.invalidURL.self) {
            try await dataFetcher.fetchData(
                url: "",
                type: Film.self
            )
        }
    }
}
