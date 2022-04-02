//
//  SearchUseCase.swift
//  OhMyHomeTests
//
//  Created by Solo on 02/04/2022.
//

import Foundation
@testable import OhMyHome

class SearchUseCaseStub : SearchUseCase {
    var searchMediaToBeReturned : Result<[ItunesMedia]>!
    var searchParameters : SearchParameters!

    func search(parameters: SearchParameters, completion: @escaping SearchCompletionHandler) {
        searchParameters = parameters
        completion(searchMediaToBeReturned)
    }
}
