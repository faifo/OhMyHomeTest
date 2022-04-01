//
//  SearchRepository.swift
//  OhMyHome
//
//  Created by Solo on 01/04/2022.
//

import Foundation

protocol SearchRepository {
    func searchItunesMedia(parameters: SearchParameters, completion: @escaping SearchCompletionHandler)
}
