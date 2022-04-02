//
//  ApiItunesMedia.swift
//  OhMyHome
//
//  Created by Solo on 01/04/2022.
//

import Foundation

struct ApiSearchResponse : Decodable {
    var resultCount : Int?
    var results : [ApiItunesMedia] = []
    
    enum CodingKeys: String,CodingKey {
        case resultCount = "resultCount"
        case results = "results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.resultCount = try container.decode(Int.self, forKey: .resultCount)
        self.results = try container.decode([ApiItunesMedia].self, forKey: .results)

        
    }
}

struct ApiItunesMedia : Decodable {
    var kind: String?
    var artworkUrl60: String?
    var trackName: String?
    var artistName: String?
    var collectionName : String?
    var artworkUrl100 : String?
    var releaseDate : String?
    
    
    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case artworkUrl60 = "artworkUrl60"
        case trackName = "trackName"
        case artistName = "artistName"
        case collectionName = "collectionName"
        case artworkUrl100 = "artworkUrl100"
        case releaseDate = "releaseDate"

    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.kind = try container.decode(String?.self, forKey: .kind)
        self.artworkUrl60 = try container.decode(String?.self, forKey: .artworkUrl60)
        self.trackName = try container.decode(String?.self, forKey: .trackName)
        self.collectionName = try container.decode(String?.self, forKey: .collectionName)
        self.artistName = try container.decode(String?.self, forKey: .artistName)
        self.artworkUrl100 = try container.decode(String?.self, forKey: .artworkUrl100)
        self.releaseDate = try container.decode(String?.self, forKey: .releaseDate)

    }
    
    func toItunesMedia() -> ItunesMedia {
        return ItunesMedia(kind: kind, artworkUrl60: artworkUrl60, trackName: trackName, artistName: artistName, collectionName: collectionName, artworkUrl100: artworkUrl100, releaseDate: releaseDate)
    }
}
