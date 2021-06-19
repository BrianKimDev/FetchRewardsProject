//
//  Service.swift
//  FetchRewardsProject
//
//  Created by Brian Kim on 6/19/21.
//

import Foundation

class NetworkManager {

    static let shared = NetworkManager()
    
    public func networkRequest(_ endpoint: String,
                               queryItems: [URLQueryItem]? = nil,
                               headers: [String: String]? = nil,
                               completion: @escaping ([String: Any]) -> Void) {
        
        guard var urlComponents = URLComponents(string: endpoint) else {
            return
        }
        
        if let queryItems = queryItems {
            urlComponents.queryItems = queryItems
        }
        
        guard let url = urlComponents.url else {
            return
        }
        
        var request = URLRequest(url: url)
        
        if let headers = headers {
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
            }
        
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                return
            }
            
            guard let mime = httpResponse.mimeType, mime == "application/json" else {
                return
            }
            
            guard let data = data else {
                
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                
                guard let dict = json as? [String: Any] else {
                    return
                }
                
                completion(dict)
            } catch {
                print(error.localizedDescription)
            }
            
        })
        
        task.resume()
    }
    
}
