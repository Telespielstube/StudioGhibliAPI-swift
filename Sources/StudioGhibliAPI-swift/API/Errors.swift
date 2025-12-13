//
//  Error.swift
//  BlossomMovie
//
//  Created by Marta Brüning on 03.12.25.
//

import Foundation

// Enum to delcare errors occuring during data parsing.
// - Inheritances:
//     Error: Any type that declares conformance to the Error protocol
//            can be used to represent an error in Swift’s error handling
//            system. Because the Error public protocol has no requirements of
//            its own, you can declare conformance on any custom type
//            you create.
//     LocalizedError: A specialized error that provides localized
//            messages describing the error and why it occurred.
//
public enum ParserError: Error, LocalizedError {
    case decodingFailed(underlyingError: Error)

    public var errorDescription: String? {
        switch self {
        case .decodingFailed(underlyingError: let error):
            return
                "Error occured while trying to parse JSON data: \(error.localizedDescription)"
        }
    }
}

// Enum to declare all possible network errors during runtime.
// - Inheritances:
//     Error: Any type that declares conformance to the Error protocol
//            can be used to represent an error in Swift’s error handling
//            system. Because the Error public protocol has no requirements of
//            its own, you can declare conformance on any custom type
//            you create.
//     LocalizedError: A specialized error that provides localized
//            messages describing the error and why it occurred.
//
public enum NetworkError: Error, LocalizedError {
    case badURLResponse
    case urlBuildFailed
    case invalidURL

    public var errorDescription: String? {
        switch self {
        case .badURLResponse:
            return "Bad URL response!"
        case .urlBuildFailed:
            return "Failed to build URL!"
        case .invalidURL:
            return "Invalid URL! Check the spelling of the endpint parameter."
        }
    }
}
