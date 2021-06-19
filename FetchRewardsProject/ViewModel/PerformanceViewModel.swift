//
//  PerformanceViewModel.swift
//  FetchRewardsProject
//
//  Created by Brian Kim on 6/19/21.
//


import UIKit

class Performer {
    
    let popularity: String?
    let stats: String?
    let divisions: String?
    let image_attribution: String?
    let slug: String?
    let id: String?
    let image: String?
    let home_team: String?
    let home_venue_id: String?
    let url: String?
    let primary: String?
    let has_upcoming_events: String?
    let short_name: String?
    let images: String?
    let location: String?
    let type: String?
    let num_upcoming_events: String?
    let image_license: String?
    let score: String?
    let taxonomies: String?
    let name: String?
    let colors: String?
    
    init?(_ data: [String: Any]) {
        self.popularity = data["popularity"] as? String
        self.stats = data["stats"] as? String
        self.divisions = data["divisions"] as? String
        self.image_attribution = data["image_attribution"] as? String
        self.slug = data["slug"] as? String
        self.id = data["id"] as? String
        self.image = data["image"] as? String
        self.home_team = data["home_team"] as? String
        self.home_venue_id = data["home_venue_id"] as? String
        self.url = data["url"] as? String
        self.primary = data["primary"] as? String
        self.has_upcoming_events = data["has_upcoming_events"] as? String
        self.short_name = data["short_name"] as? String
        self.images = data["images"] as? String
        self.location = data["location"] as? String
        self.type = data["type"] as? String
        self.num_upcoming_events = data["num_upcoming_events"] as? String
        self.image_license = data["image_license"] as? String
        self.score = data["score"] as? String
        self.taxonomies = data["taxonomies"] as? String
        self.name = data["name"] as? String
        self.colors = data["colors"] as? String
    }
}
