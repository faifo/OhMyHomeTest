//
//  Result.swift
//  OhMyHome
//
//  Created by Solo on 01/04/2022.
//

import Foundation
struct CoreError: Error {
    var localizedDescription: String {
        return message
    }
    
    var message = ""
}

typealias Result<T> = Swift.Result<T, Error>
