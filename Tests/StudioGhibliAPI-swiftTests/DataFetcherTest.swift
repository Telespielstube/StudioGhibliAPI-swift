//
//  Test.swift
//  StudioGhibliAPI-swift
//
//  Created by Marta Brüning on 11.12.25.
//

import Testing

@testable import StudioGhibliAPI_swift

struct Test {

    @Test func testIfURLBuildThrowsErrorWhenWrongResourceIsPassed() async throws
    {
        let dataFetcher = DataFetcher()

        await #expect(throws: NetworkError.self) {
            try await dataFetcher.fetchData(
                url: "marta",
                type: Film.self
            )
        }
    }
    
    @Test func testIfURLBuildThrowsErrorWhenEmptyResourceIsPassed() async throws
    {
        let dataFetcher = DataFetcher()

        await #expect(throws: NetworkError.self) {
            try await dataFetcher.fetchData(
                url: "",
                type: Film.self
            )
        }
    }
}
