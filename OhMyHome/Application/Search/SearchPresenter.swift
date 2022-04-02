//
//  SearchPresenter.swift
//  OhMyHome
//
//  Created by Solo on 01/04/2022.
//

import UIKit

protocol SearchPresenter : ViewControllerBaseProtocol, SearchBarBaseProtocol {
    func configureCell(cell : ItunesMediaCell, at row : Int)
    func loadMore()
    func moveToDetail(at row : Int)
}

protocol SearchView: AnyObject {
    func refreshTableView()
}

class SearchPresenterImpl: SearchPresenter {
    fileprivate weak var view: SearchView?
    fileprivate var searchUseCase: SearchUseCase
    private(set) var router: SearchRouter
    var term : String?
    var offset : Int = 0
    var hasMore : Bool = true
    var medias : [ItunesMedia] = []

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
        search()
    }
    
    func search() {
        guard let searchTerm = term else {
                //TODO: handle empty search here
            return
        }
        
        guard hasMore == true else {
            return
        }
        
        searchUseCase.search(parameters: SearchParameters(term: searchTerm, offset: offset)) {[weak self] result in
            guard let self = self else {
                return
            }
            switch result {
                case let .success(newMedias):
                    // check if has more data
                    self.hasMore = newMedias.count == 50
                    
                    if self.hasMore {
                        // increase offset
                        self.offset += 1
                    }
                    
                    self.medias += newMedias
                    
                    self.view?.refreshTableView()
                    
                case let .failure(error):
                    print(error.localizedDescription)
                    
            }
        }
    }
    
    func configureCell(cell: ItunesMediaCell, at row: Int) {
        let media = self.medias[row]
        cell.kindLabel.text = media.kind ?? ""
        cell.titleLabel.text = media.trackName ?? ""
        
        if let imageUrl = media.artworkUrl60, let url = URL(string: imageUrl) {
            URLSession.shared.dataTask( with: url, completionHandler: {
                (data, response, error) -> Void in
                DispatchQueue.main.async {
                    if let data = data {
                        cell.artworkImageView.image = UIImage(data: data)
                    }
                }
            }).resume()
        }
    }
    
    func loadMore() {
        search()
    }
    
    func moveToDetail(at row: Int) {
        let media = self.medias[row]
        self.router.moveToDetail(media: media)
    }
}
