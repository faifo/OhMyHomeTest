//
//  ApiSearchRepositorySpy.swift
//  OhMyHomeTests
//
//  Created by Solo on 02/04/2022.
//

import Foundation
@testable import OhMyHome

class ApiSearchRepositorySpy : ApiSearchRepository {
    
    var searchMediaToBeReturned : Result<[ItunesMedia]>!
    var searchParameters : SearchParameters!
    
    func searchItunesMedia(parameters: SearchParameters, completion: @escaping SearchCompletionHandler) {
        searchParameters = parameters
        completion(searchMediaToBeReturned)
    }
}
