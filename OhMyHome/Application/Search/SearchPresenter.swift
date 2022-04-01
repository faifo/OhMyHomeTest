//
//  SearchPresenter.swift
//  OhMyHome
//
//  Created by Solo on 01/04/2022.
//

import UIKit

protocol SearchPresenter : ViewControllerBaseProtocol, SearchBarBaseProtocol {
    
}

protocol SearchView: AnyObject {
    
}

class SearchPresenterImpl: SearchPresenter {
    fileprivate weak var view: SearchView?
    fileprivate var searchUseCase: SearchUseCase
    private(set) var router: SearchRouter
    var term : String?
    var offset : Int = 0

    init(view: SearchView, useCase: SearchUseCase, router: SearchRouter) {
        self.view = view
        self.searchUseCase = useCase
        self.router = router
    }
    
    func viewDidLoad() {
        
    }
    
    func textDidChange(searchBar: UISearchBar, text: String?) {
        term = text
    }
    
    func searchButtonClicked(searchBar: UISearchBar) {
        guard let searchTerm = term else {
            //TODO: handle empty search here
            return
        }
        searchUseCase.search(parameters: SearchParameters(term: searchTerm, offset: offset)) { result in
            switch result {
                case let .success(object):
                    print("success")
                case let .failure(error):
                    print(error.localizedDescription)
                
            }
        }
    }
}
