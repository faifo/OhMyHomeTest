//
//  SearchPresenterSpy.swift
//  OhMyHomeTests
//
//  Created by Solo on 02/04/2022.
//

import UIKit

@testable import OhMyHome

class SearchPresenterSpy : SearchPresenter {
    var router: SearchRouter
    
    init(router: SearchRouter) {
        self.router = router
    }
    
    func configureCell(cell: ItunesMediaCell, at row: Int) {
        
    }
    
    func loadMore() {
        
    }
    
    func moveToDetail(at row: Int) {
        
    }
    
    func viewDidLoad() {
        
    }
    
    func textDidChange(searchBar: UISearchBar, text: String?) {
        
    }
    
    func searchButtonClicked(searchBar: UISearchBar) {
        
    }
    
    
}
