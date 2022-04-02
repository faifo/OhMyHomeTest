//
//  ItunesMedia.swift
//  OhMyHomeTests
//
//  Created by Solo on 02/04/2022.
//

import Foundation
@testable import OhMyHome
extension ItunesMedia {
    static func createArray(numberOfElements: Int = 2) -> [ItunesMedia] {
        var medias = [ItunesMedia]()
        
        for i in 0..<numberOfElements {
            let media = createMedia(index: i)
            medias.append(media)
        }
        return medias
    }
    
    static func createMedia(index: Int = 0) -> ItunesMedia {
        return ItunesMedia(kind: "\(index)", artworkUrl60: "\(index)", trackName: "\(index)", artistName: "\(index)", collectionName: "\(index)", artworkUrl100: "\(index)", releaseDate: "\(Date())")
    }
}
