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
    
    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case artworkUrl60 = "artworkUrl60"
        case trackName = "trackName"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.kind = try container.decode(String?.self, forKey: .kind)
        self.artworkUrl60 = try container.decode(String?.self, forKey: .artworkUrl60)
        self.trackName = try container.decode(String?.self, forKey: .trackName)
    }
    
    func toItunesMedia() -> ItunesMedia {
        return ItunesMedia(kind: kind, artworkUrl60: artworkUrl60, trackName: trackName)
    }
}
