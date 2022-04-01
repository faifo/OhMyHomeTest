//
//  ApiRequest+Extensions.swift
//  OhMyHome
//
//  Created by Solo on 01/04/2022.
//

import Foundation
extension ApiRequest {
    
    func buildURL(path: String, parameters: [String: String]?) -> URL {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "itunes.apple.com"
        urlComponents.path = path
        urlComponents.queryItems = parameters?.map { (key: String, value: String) in
            URLQueryItem(name: key, value: value)
        }
        
        guard let url = urlComponents.url else {
            fatalError("Error: expected iTunes URL but instead it is nil")
        }
        return url
    }

}
