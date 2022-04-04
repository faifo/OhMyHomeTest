//
//  URLPercentEncoding+Extension.swift
//  OhMyHome
//
//  Created by Solo on 04/04/2022.
//

import Foundation

@propertyWrapper
struct URLPercentEncoding {
    var wrappedValue: URL?
}

extension URLPercentEncoding: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let str = try? container.decode(String.self),
           let encoded = str.addingPercentEncoding(
            withAllowedCharacters: .urlFragmentAllowed),
           let url = URL(string: encoded) {
            
            self.wrappedValue = url
            
        } else {
            self.wrappedValue = nil
            throw DecodingError.dataCorrupted(
                .init(codingPath: container.codingPath, debugDescription: "Corrupted url"))
        }
    }
}
