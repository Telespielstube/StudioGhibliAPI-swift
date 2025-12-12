//
//  DataFetcher.swift
//  GhibliAPI-swift
//
//  Created by Marta Brüning on 10.12.25.
//

import Foundation

/// This class handles the
///
@available(macOS 12.0, *)
class DataFetcher {

    // Decode received JSON data set from the Ghibli API.
    //
    // - Parameters:
    //      url : The endpoint for data fetching.
    //      type: Generic type of the endpoint type e.g. films, species...
    //
    // - Returns:
    //      T: Generic type of the decoded JSON data.
    //
    // - Error:
    //      NetworkError: Is thrown if a status code is not 200.
    //      ParserError: Is thorwn if a json parsing error occurs.
    func fetchData<T: Decodable>(url: String, type: T.Type) async throws -> T {
        let url = try buildURL(forEndpoint: url)
        let (data, response) = try await URLSession.shared.data(from: url)
        let urlResponse = response as? HTTPURLResponse

        switch urlResponse?.statusCode {
        case 200:
            do {
                let json = try JSONDecoder().decode(type, from: data)
                return json
            } catch let error {
                throw ParserError.decodingFailed(
                    underlyingError: error)
            }
        case 400, 404:
            throw NetworkError.badURLResponse
        default:
            throw NetworkError.badURLResponse
        }
    }

    // Parses the received json data.
    //
    // - Parameters:
    //          data: The data that is going to be paresed by the decoder.
    //
    // - Returns: A generic type of parsed json data.
    private func parseJSONData<T: Decodable>(_ data: Data) async throws -> T {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch let error as DecodingError {
            throw ParserError.decodingFailed(
                underlyingError: error)
        }
    }

    // Simple helper function to build the base url and the endpoint for data fetching.
    //
    // - Parameters:
    //    endpoint : Describes the REST resource where the data is stored.
    //
    // Returns: A working URL object.
    private func buildURL(forEndpoint endpoint: String) throws -> URL {
        var component = URLComponents()
        component.scheme = "https"
        component.host = "ghibliapi.vercel.app"
        component.path = "/\(endpoint)"
        guard let url = component.url else {
            throw NetworkError.urlBuildFailed
        }
        return url
    }
}
