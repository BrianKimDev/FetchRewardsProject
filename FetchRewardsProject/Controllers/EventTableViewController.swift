//
//  EventTableViewController.swift
//  FetchRewardsExercise
//
//  Created by Brian Kim on 6/16/21.
//


import UIKit


class EventTableViewController: UITableViewController {
    
    var allEvents: [Event] = []
    var events: [Event] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.accessibilityIdentifier = "Search"
        navigationItem.searchController = SearchBar(delegate: self)
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        
        
        
        SeatGeekAPIManager.queryEvents { events in
            guard let events = events else {
                print("couldn't load images")
                return
            }
            self.allEvents = events
            self.events = events
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
}

// MARK: UISearchResultsUpdating
extension EventTableViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        defer { tableView.reloadData() }
        guard let searchText = searchController.searchBar.text, !searchText.isEmpty else {
            events = allEvents
            return
        }
        events = allEvents.filter { $0.allText.contains(searchText) }
    }
    
}

// MARK: TableViewDelegate & TableViewDataSource
extension EventTableViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return EventCellView(events[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailViewController = ExpandedEventController()
        detailViewController.event = events[indexPath.row]
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? EventCellView {
            cell.setSelected(true, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? EventCellView {
            cell.setSelected(false, animated: true)
        }
    }
    
}
