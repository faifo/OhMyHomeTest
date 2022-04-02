//
//  SearchRouter.swift
//  OhMyHome
//
//  Created by Solo on 01/04/2022.
//

import Foundation

protocol SearchRouter {
    func moveToDetail(media : ItunesMedia)
}

class SearchRouterImpl : SearchRouter {
    fileprivate weak var searchViewController: SearchViewController?
    
    init(searchViewController: SearchViewController) {
        self.searchViewController = searchViewController
    }
    
    func moveToDetail(media : ItunesMedia) {
        //TODO: move to detail here
        let detailViewController = DetailsViewController()
        let factory = DetailsFactory()
        factory.configure(detailsViewController: detailViewController)
        detailViewController.presenter.media = media
        DispatchQueue.main.async {
            self.searchViewController?.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}
