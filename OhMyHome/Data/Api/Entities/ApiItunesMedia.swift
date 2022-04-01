//
//  ApiItunesMedia.swift
//  OhMyHome
//
//  Created by Solo on 01/04/2022.
//

import Foundation

struct ApiItunesMedia {
    var kind: String?
    var artworkUrl60: String?
    var trackName: String?
    
    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case artworkUrl60 = "artworkUrl60"
        case trackName = "trackName"
    }
}
