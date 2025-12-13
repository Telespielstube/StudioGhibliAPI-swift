//
//  File.swift
//  StudioGhibliAPI-swift
//
//  Created by Marta Brüning on 13.12.25.
//

import Foundation
import Testing

@testable import StudioGhibliAPI_swift

public struct UrlQueryTests {
    @Test
    func testIfAllFilmsAreFetched() async throws {
        let filmQuery = UrlQuery()
        let films = try await filmQuery.getAll(endpoint: "films", type: Film.self)
        #expect(films.count > 0)
    }

    @Test
    func testIfFilterFilmsByNameReturnsAtLeastOneFilmObject() async throws {
        let filmQuery = UrlQuery()
        let filteredFilms: [Film] = try await filmQuery.filter(
            endpoint: "films",
            filterBy: \Film.title,
            value: "Spirited Away"
        )
        #expect(filteredFilms.count > 0)
        #expect(filteredFilms[0].title.contains("Spirited Away"))
    }
    
    @Test func testIfFilmsGetAllFilms() async throws {
        let ghibli = StudioGhibliAPI()
        let content: [Film] = try await ghibli.query.getAll(
            endpoint: "films",
            type: Film.self
        )
        #expect(content.isEmpty == false)
        #expect(content.count > 0)
    }
    
    
//    @Test func testIfGetAllThrowsParserErrorForWrongType() async throws {
//        let ghibli = StudioGhibliAPI()
//        
//        #expect(throws: ParserError.self) {
//            // We attempt to parse the 'films' data into a wrong type (e.g., 'Person')
//            // and expect this operation to throw a ParserError.
//            let _: [Film] = try await ghibli.query.getAll(
//                endpoint: "films",
//                type: .self
//            )
//        }
//    }
}
