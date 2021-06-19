//
//  EventData.swift
//  FetchRewardsProject
//
//  Created by Brian Kim on 6/19/21.
//

import UIKit

enum EventsPath {
    case events
    case performers
    case venues
    
    case event(id: String)
    case performer(id: String)
    case venue(id: String)
    
    var path: String {
        switch self {
        case .events:
            return "/events"
        case .performers:
            return "/performers"
        case .venues:
            return "/venues"
        case .event(let id):
            return "/events/\(id)"
        case .performer(let id):
            return "/performers/\(id)"
        case .venue(let id):
            return "/venues/\(id)"
        }
    }
    
    var endpoint: String {
        return "\(baseURL)\(path)"
    }
}













