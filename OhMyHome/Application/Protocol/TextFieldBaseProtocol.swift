//
//  TextFieldBaseProtocol.swift
//  OhMyHome
//
//  Created by Solo on 01/04/2022.
//

import UIKit

protocol SearchBarBaseProtocol {
    func textDidChange(searchBar: UISearchBar, text: String?)
    func searchButtonClicked(searchBar: UISearchBar)
}
