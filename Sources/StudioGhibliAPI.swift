// The Swift Programming Language
// https://docs.swift.org/swift-book

//
//  main.swift
//  GhibliAPI-cli
//
//  Created by Marta Brüning on 10.12.25.
//
@available(macOS 12.0, *)

public final class StudioGhibliAPI {
    public let query: UrlQuery

    public init() {
        self.query = UrlQuery()
    }
}
