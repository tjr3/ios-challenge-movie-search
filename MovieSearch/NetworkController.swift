//
//  NetworkController.swift
//  MovieSearch
//
//  Created by Tyler on 6/3/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation


class NetworkController {
    
    enum HTTPMethod: String {
        case Get = "GET"
        case Put = "PUT"
        case Post = "POST"
        case Patch = "PATCH"
        case Delete = "DELETE"
    }
    
    static func performRequestForURL(url: NSURL, completion: ((data: NSData?, error: NSError?) -> Void)?) {

        
        let session = NSURLSession.sharedSession()
        let dataTask = session.dataTaskWithURL(url) { (data, response, error) in
            if let completion = completion {
                completion(data: data, error: error)
            }
        }
        dataTask.resume()
    }
    
    static func urlFromURLParameters(url: NSURL, urlParameters: [String: String]?) -> NSURL {
        
        let components = NSURLComponents(URL: url, resolvingAgainstBaseURL: true)
        
        components?.queryItems = urlParameters?.flatMap({NSURLQueryItem(name: $0.0, value: $0.1)})
        
        
        if let url = components?.URL {
            return url
        } else {
            fatalError("URL optional is nil")
        }
    }
}
