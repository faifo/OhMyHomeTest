//
//  SearchRouter.swift
//  OhMyHome
//
//  Created by Solo on 01/04/2022.
//

import Foundation

protocol SearchRouter {
    func moveToDetail()
}

class SearchRouterImpl : SearchRouter {
    fileprivate weak var searchViewController: SearchViewController?
    
    init(searchViewController: SearchViewController) {
        self.searchViewController = searchViewController
    }
    
    func moveToDetail() {
        //TODO: move to detail here
    }
}
