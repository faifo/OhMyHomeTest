//
//  NSError+Extensions.swift
//  OhMyHomeTests
//
//  Created by Solo on 02/04/2022.
//

import Foundation
extension NSError {
    static func createError(withMessage message: String) -> NSError {
        return NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: message])
    }
}
