//
//  SearchFactory.swift
//  OhMyHome
//
//  Created by Solo on 01/04/2022.
//

import Foundation

class SearchFactory {
    func configure(searchViewController: SearchViewController) {
        let apiClient = ApiClientImplementation(urlSessionConfiguration: URLSessionConfiguration.default,
                                                completionHandlerQueue: OperationQueue.main)
        let apiRepository = ApiSearchRepositoryImpl(apiClient: apiClient)
      
        let searchUseCase = SearchUseCaseImpl(repo: apiRepository)
        let router = SearchRouterImpl(searchViewController: searchViewController)
        
        let presenter = SearchPresenterImpl(view: searchViewController, useCase: searchUseCase, router: router)
        searchViewController.presenter = presenter
    }
}
