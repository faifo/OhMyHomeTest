//
//  SearchRouterSpy.swift
//  OhMyHomeTests
//
//  Created by Solo on 02/04/2022.
//

import Foundation

@testable import OhMyHome
class SearchRouterSpy : SearchRouter {
    var didMoveToDetail = false
    func moveToDetail(media: ItunesMedia) {
        didMoveToDetail = true
    }
}
