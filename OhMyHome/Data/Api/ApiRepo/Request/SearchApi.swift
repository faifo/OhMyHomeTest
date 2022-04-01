//
//  SearchItunesApi.swift
//  OhMyHome
//
//  Created by Solo on 01/04/2022.
//

import Foundation

struct SearchApi : ApiRequest {
    
    var parameters: [String : String]?
    
    var urlRequest: URLRequest {
        let url = buildURL(path: "/search", parameters: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
}
