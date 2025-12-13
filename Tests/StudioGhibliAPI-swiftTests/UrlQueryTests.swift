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
    func testIfFilterFilmsByNameReturnsAtLeastOneFilmObject() async throws {
        let filteredFilms: [Film] = try await UrlQuery<Film>.filter(
            endpoint: "films",
            filterBy: \Film.title,
            value: "Spirited Away"
        )
        #expect(filteredFilms.count > 0)
        #expect(filteredFilms[0].title.contains("Spirited Away"))
    }

    @Test
    func testIfFilterVehicleByNameReturnsAtLeastOneVehicleObject() async throws
    {
        let filteredVehicles: [Vehicle] = try await UrlQuery<Vehicle>.filter(
            endpoint: "vehicles",
            filterBy: \Vehicle.name,
            value: "Air Destroyer Goliath"
        )
        #expect(filteredVehicles.count > 0)
        #expect(filteredVehicles[0].name.contains("Air Destroyer Goliath"))
    }

    @Test func testIfFilmsGetAllFilms() async throws {
        let content: [Film] = try await UrlQuery<Film>.getAll(
            endpoint: "films",
            type: Film.self
        )
        #expect(content.isEmpty == false)
        #expect(content.count >= 22)
    }

    @Test func testIfGetAllThrowsParserErrorForWrongType() async throws {
        await #expect(throws: ParserError.self) {
            // We attempt to parse the 'films' data into a wrong type (e.g., 'Person')
            // and expect this operation to throw a ParserError.
            let _: [Film] = try await UrlQuery<Film>.getAll(
                endpoint: "films",
                type: People.self
            ) as! [Film]
        }
    }
}
