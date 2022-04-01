//
//  ApiSearchRepository.swift
//  OhMyHome
//
//  Created by Solo on 01/04/2022.
//

import Foundation

protocol ApiSearchRepository : SearchRepository {
  
}

class ApiSearchRepositoryImpl : ApiSearchRepository {
    
    let apiClient : ApiClient
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func searchItunesMedia(parameters: SearchParameters, completion: @escaping SearchCompletionHandler) {
        let searchApiRequest = SearchApi(parameters: ["term" : parameters.term, "limit" : "\(20)", "offset": "\(parameters.offset)"])
        apiClient.execute(request: searchApiRequest) { (result: Result<ApiResponse<ApiSearchResponse>>) in
            switch result {
                case let .success(response):
                    let media = response.entity.results.map { obj in
                        return obj.toItunesMedia()
                    }
                    completion(.success(media))
                case let .failure(error):
                    completion(.failure(error))
            }
        }
    }
}
