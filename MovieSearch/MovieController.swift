//
//  MovieController.swift
//  MovieSearch
//
//  Created by Tyler on 6/3/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class MovieController {
    
    
    static let baseurl = NSURL(string: "http://api.themoviedb.org/3/movie")
    
    static let endpoint = baseurl?.URLByAppendingPathComponent("/id")
    
    let movie: [Movie] = []
    
    func getMovie(completion: ((movies: [Movie]) -> Void)? = nil) {
        
        guard let url = MovieController.endpoint else {fatalError("URL optional is nil")
        }
        
        NetworkController.performRequestForURL(url, httpMethod: .Get) { (data, error) in
            guard let data = data,
                
                jsonDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [[String:AnyObject]] else {
                    if let completion = completion {
                        completion (movies: [])
                    }
                    return
            }
            let moviesArray = jsonDictionary.flatMap {Movie(dictionary: $0
                )}
            if let completion = completion {
                completion(movies: moviesArray)
                return
            }
        }
    }
}
