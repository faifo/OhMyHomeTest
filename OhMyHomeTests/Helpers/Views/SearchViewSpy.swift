//
//  SearchViewSpy.swift
//  OhMyHomeTests
//
//  Created by Solo on 02/04/2022.
//

import Foundation
@testable import OhMyHome

class SearchViewSpy : SearchView {
    var refreshTableViewCalled = false
    var finishLoadingSuccessed = false
    
    func refreshTableView() {
        refreshTableViewCalled = true
    }
    
    func updateViewControllerState(state: ViewControllerState) {
        switch state {
            case .finish(nil):
                finishLoadingSuccessed = true
            default:
                finishLoadingSuccessed = false
        }
    }
    
    
}
