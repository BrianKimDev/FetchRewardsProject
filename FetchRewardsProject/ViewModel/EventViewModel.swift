//
//  EventViewModel.swift
//  FetchRewardsProject
//
//  Created by Brian Kim on 6/19/21.
//
import UIKit

class Event {
    let id: String
    let title: String
    let description: String
    let datetime_local: String?
    let short_title: String?
    let created_at: String?
    let venue: String?
    let status: String?
    let is_open: String?
    let enddatetime_utc: String?
    let datetime_tbd: String?
    let event_promotion: String?
    let datetime_utc: String?
    let visible_until_utc: String?
    let time_tbd: String?
    let date_tbd: String?
    let url: String?
    let announce_date: String?
    let performers: [Performer]
    
    
    lazy var imageUrl: String? = {
        if let performer = performers.first {
            return performer.image
        }
        return nil
    }()
    
    lazy var eventDate: String = {
        return (datetime_local ?? "").getDisplayDate()
    }()
    
    lazy var allText: String = {
        return Mirror(reflecting: self).children.compactMap({ property in
            if let value = property.value as? String {
                return value
            } else { return nil }
        }).joined(separator: " ")
    }()
    
    

    init?(_ data: [String: Any]) {
        
        if let id = data["id"] as? Int {
            self.id = String(id)
        } else {
            return nil
        }
        
        if let title = data["title"] as? String, !title.trimmingCharacters(in: .whitespaces).isEmpty {
            self.title = title
        } else {
            self.title = ""
        }
        
        if let description = data["description"] as? String, !description.trimmingCharacters(in: .whitespaces).isEmpty {
            self.description = description
        } else {
            self.description = ""
        }
        
        self.short_title = data["short_title"] as? String
        
        self.datetime_utc = data["datetime_utc"] as? String
        self.datetime_local = data["datetime_local"] as? String
        
        self.venue = data["venue"] as? String
        self.created_at = data["created_at"] as? String
        self.status = data["status"] as? String
        self.is_open = data["is_open"] as? String
        self.enddatetime_utc = data["enddatetime_utc"] as? String
        self.datetime_tbd = data["datetime_tbd"] as? String
        self.event_promotion = data["event_promotion"] as? String
        self.visible_until_utc = data["visible_until_utc"] as? String
        self.time_tbd = data["time_tbd"] as? String
        self.date_tbd = data["date_tbd"] as? String
        self.url = data["url"] as? String
        self.announce_date = data["announce_date"] as? String
        self.performers = (data["performers"] as? [[String: Any]])?.compactMap({ Performer($0) }) ?? []
    }
    
}

