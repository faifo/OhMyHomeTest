//
//  SearchUseCase.swift
//  OhMyHome
//
//  Created by Solo on 01/04/2022.
//

import Foundation

typealias SearchCompletionHandler = (Result<[ItunesMedia]>) -> Void

struct SearchParameters {
    var term : String
    var offset : Int
}

protocol SearchUseCase {
    func search(parameters: SearchParameters, completion: @escaping SearchCompletionHandler)
}

class SearchUseCaseImpl : SearchUseCase {
    
    let searchRepo : SearchRepository
    
    init(repo: SearchRepository) {
        self.searchRepo = repo
    }
    
    func search(parameters: SearchParameters, completion: @escaping SearchCompletionHandler) {
        self.searchRepo.searchItunesMedia(parameters: parameters) { result in
            completion(result)
        }
    }
}
