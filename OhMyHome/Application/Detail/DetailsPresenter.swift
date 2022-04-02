//
//  DetailsPresenter.swift
//  OhMyHome
//
//  Created by Solo on 02/04/2022.
//

import UIKit

protocol DetailsPresenter {
    func backToSearch()
    func configureArtWork(cell : ArtworkCell)
    func configureDetails(cell : DetailCell, row : Int)
}

protocol DetailsView : AnyObject {
}

class DetailsPresenterImpl : DetailsPresenter {
    fileprivate weak var view: DetailsView?
    private(set) var router: DetailsRouter
    var media : ItunesMedia!
    
    init(view: DetailsView, router: DetailsRouter) {
        self.view = view
        self.router = router
    }
    
    func backToSearch() {
        router.popBackToSearch()
    }
    
    func configureArtWork(cell: ArtworkCell) {
        if let imageUrl = media.artworkUrl100, let url = URL(string: imageUrl) {
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
    
    func configureDetails(cell: DetailCell, row: Int) {
        switch row {
            case DetailsRowType.TrackName.rawValue:
                cell.titleLabel.text = "Track"
                cell.valueLabel.text = media.trackName ?? ""
            case DetailsRowType.Collection.rawValue:
                cell.titleLabel.text = "Collection"
                cell.valueLabel.text = media.collectionName ?? ""
            case DetailsRowType.TrackName.rawValue:
                cell.titleLabel.text = "Artist"
                cell.valueLabel.text = media.artistName ?? ""
            case DetailsRowType.TrackName.rawValue:
                cell.titleLabel.text = "Release Date"
                cell.valueLabel.text = media.releaseDate ?? ""
            case DetailsRowType.Kind.rawValue:
                cell.titleLabel.text = "Kind"
                cell.valueLabel.text = media.kind ?? ""
            default:
                break
        }
    }
}
