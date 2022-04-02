//
//  DetailsRouter.swift
//  OhMyHome
//
//  Created by Solo on 02/04/2022.
//

import Foundation

protocol DetailsRouter {
    func popBackToSearch()
}

class DetailsRouterImpl : DetailsRouter {
    fileprivate weak var detailsViewController: DetailsViewController?
    
    init(detailsViewController: DetailsViewController) {
        self.detailsViewController = detailsViewController
    }
    
    func popBackToSearch() {
        DispatchQueue.main.async {
            self.detailsViewController?.navigationController?.popViewController(animated: true)
        }
    }
}
