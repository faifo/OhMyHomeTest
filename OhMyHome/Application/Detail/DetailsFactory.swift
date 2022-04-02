//
//  DetailsFactory.swift
//  OhMyHome
//
//  Created by Solo on 02/04/2022.
//

import Foundation

class DetailsFactory {
    func configure(detailsViewController: DetailsViewController) {
        let router = DetailsRouterImpl(detailsViewController: detailsViewController)
        let presenter = DetailsPresenterImpl(view: detailsViewController, router: router)
        detailsViewController.presenter = presenter
    }
}
