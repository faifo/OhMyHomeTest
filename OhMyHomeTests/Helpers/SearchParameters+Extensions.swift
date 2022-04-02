//
//  SearchParameters+Extensions.swift
//  OhMyHomeTests
//
//  Created by Solo on 02/04/2022.
//

import Foundation
@testable import OhMyHome

extension SearchParameters {
    static func createParameters() -> SearchParameters {
        return SearchParameters(term: "Britney", offset: 0)
    }
}

extension SearchParameters: Equatable { }

public func == (lhs: SearchParameters, rhs: SearchParameters) -> Bool {
    return lhs.term == rhs.term && lhs.offset == rhs.offset
}
