//
//  FilmQueryTest.swift
//  GhibliAPI-cli
//
//  Created by Marta Brüning on 11.12.25.
//
//
import Foundation
import Testing

@testable import StudioGhibliAPI_swift

struct FilmQueryTest {
    @Test
    func helloWorld() {
        let greeting = "Hello, world!"
        #expect(greeting != "Hello")  // Expectation failed: (greeting → "Hello, world!") == "Hello"
    }

    @Test
    func testIfAllFilmsAreFetched() async throws {
        let filmQuery = FilmQuery()
        let films = try await filmQuery.getAll(endpoint: "films")
        #expect(films.count > 0)
    }

    @Test
    func testIfFilterFilmsByNameReturnsAtLeastOneFilmObject() async throws {
        let filmQuery = FilmQuery()
        let filteredFilms: [Film] = try await filmQuery.filter(
            endpoint: "films",
            filterByName: "Spirited Away"
        )
        #expect(filteredFilms.count > 0)
        #expect(filteredFilms[0].title.contains("Spirited Away"))
    }
}
