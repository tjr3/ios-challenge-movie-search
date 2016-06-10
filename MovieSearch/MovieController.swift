//
//  MovieController.swift
//  MovieSearch
//
//  Created by Tyler on 6/10/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class MovieController {
    
    static let sharedController = MovieController()
    
    static let baseURL = "https://api.themoviedb.org/3"
    
    static let apiKey = "2749a8202386832b2662a9a43e718912"
    
    static var movieSearchURLString = ""
    
    // Serializing JSON
    var url: NSURL?
    static func searchForMovieBySearchTerm(searchTerm: String, completion: (movies: [Movie]) -> Void) {
        if let escapedSearchTerm = searchTerm.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet()) {
            // Creating endpoing URL
            movieSearchURLString = baseURL + "/search/movie/"
            movieSearchURLString = movieSearchURLString + "?"
            movieSearchURLString = movieSearchURLString + "api_key=" + apiKey
            movieSearchURLString = movieSearchURLString + "&" + "query=" + escapedSearchTerm
        }
        
        if let url = NSURL(string: movieSearchURLString) {
            NetworkController.performRequestForURL(url, completion: { (data, error) in
                guard let data = data,
                    jsonAnyObject = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments),
                    jsonDictionary = jsonAnyObject as? [String:AnyObject],
                    moviesDictionary = jsonDictionary ["results"] as? [[String:AnyObject]]
                    else {
                        completion(movies: [])
                        return }
                let movies = moviesDictionary.flatMap{Movie(dicitonary: $0)}
                print(movies)
                completion(movies: movies)
            })
        }
    }
}