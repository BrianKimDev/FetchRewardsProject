//
//  SeatGeek.swift
//  FetchRewardsProject
//
//  Created by Brian Kim on 6/19/21.
//


import Foundation

 let baseURL = "https://api.seatgeek.com/2"
 let clientId = "client_id"
 let key = "client_secret"

class SeatGeekAPIManager {
    
    private static var headers: [String: String] {
        return [
            "Content-Type": "application/json",
        ]
    }
    
    private static var queryItems: [URLQueryItem] {
        return [
            URLQueryItem(name: clientId, value: ApiKey.seatGeekClientId),
            URLQueryItem(name: key, value: ApiKey.seatGeekKey)
            
        ]
    }
    
    public static func queryEvents(completion: @escaping ([Event]?) -> Void) {
        NetworkManager.shared.networkRequest(EventsPath.events.endpoint,
                                             queryItems: queryItems,
                                             headers: headers) { data in
            guard let eventsDict = data["events"] as? [[String:Any]] else {
                completion(nil)
                return
            }
            
            let events = eventsDict.compactMap({ Event($0) })
            
            completion(events)
            
        }
    }
    

}
