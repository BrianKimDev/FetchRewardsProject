//
//  SearchBar.swift
//  FetchRewardsExercise
//
//  Created by Brian Kim on 6/16/21.
//

import UIKit


class SearchBar: UISearchController {
    
    init(delegate: EventTableViewController) {
        super.init(searchResultsController: nil)
        searchResultsUpdater = delegate
        obscuresBackgroundDuringPresentation = false
        hidesNavigationBarDuringPresentation = false
        definesPresentationContext = true
        searchBar.placeholder = "Search"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
