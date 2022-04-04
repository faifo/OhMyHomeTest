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
    @URLPercentEncoding var artworkUrl60: URL?
    @URLPercentEncoding var artworkUrl100 : URL?

    var trackName: String?
    var artistName: String?
    var collectionName : String?
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
        self.kind = try container.decodeIfPresent(String?.self, forKey: .kind) ?? nil
        self.artworkUrl60 = try container.decodeIfPresent(URL?.self, forKey: .artworkUrl60) ?? nil
        self.trackName = try container.decodeIfPresent(String?.self, forKey: .trackName) ?? nil
        self.collectionName = try container.decodeIfPresent(String?.self, forKey: .collectionName) ?? nil
        self.artistName = try container.decodeIfPresent(String?.self, forKey: .artistName) ?? nil
        self.artworkUrl100 = try container.decodeIfPresent(URL?.self, forKey: .artworkUrl100) ?? nil
        self.releaseDate = try container.decodeIfPresent(String?.self, forKey: .releaseDate) ?? nil

    }
    
    func toItunesMedia() -> ItunesMedia {
        return ItunesMedia(kind: kind, artworkUrl60: artworkUrl60, trackName: trackName, artistName: artistName, collectionName: collectionName, artworkUrl100: artworkUrl100, releaseDate: releaseDate)
    }
}
