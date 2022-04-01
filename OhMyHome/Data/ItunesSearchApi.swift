//
//  ItunesSearchApi.swift
//  OhMyHome
//
//  Created by Solo on 01/04/2022.
//

import Foundation
enum ItunesSearchApi {
    case Search([String:Any])
}


extension ItunesSearchApi: EndPointType {
    var baseURL: URL {
        URL(string: " https://itunes.apple.com/")!
    }
    
    var path: String {
        switch self {
            case .Search:
                return "search"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
            case .Search:
                return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
            case .Search(let searchParams):
                return .requestParameters(bodyParameters: nil,
                                          bodyEncoding: .urlEncoding,
                                          urlParameters: searchParams)
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
            case .Search:
                return [:]
        }
    }
}
