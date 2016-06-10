//
//  MovieController.swift
//  MovieSearch
//
//  Created by Tyler on 6/3/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

class MovieController {
    
    static let sharedController = MovieController()
    
    static let baseURL = "https://api.themoviedb.org/3"
    
    static let apiKey = "2749a8202386832b2662a9a43e718912"
    
    static var movieSearchURLString = ""
    
    var url: NSURL?
    static func searchForMovieWithSearchTerm(searchTerm: String, completion: (movies: [Movie]) -> Void) {
        if let escapedSearchTerm = searchTerm.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet()) {
            
            print(escapedSearchTerm)
            
            movieSearchURLString = baseURL + "/search/movie/"
            movieSearchURLString = movieSearchURLString + "?"
            movieSearchURLString = movieSearchURLString + "api_key=" + apiKey
            movieSearchURLString = movieSearchURLString + "&" + "query=" + escapedSearchTerm
            print(movieSearchURLString)
        }
        
        
        
        if let url = NSURL(string: movieSearchURLString) {
            NetworkController.performRequestForURL(url) { (data, error) in 
                guard let data = data,
                    jsonAnyObject = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments),
                    jsonDictionary = jsonAnyObject as? [String:AnyObject],
                    moviesDictionary = jsonDictionary ["results"] as? [[String:AnyObject]]
                    else {
                        completion(movies: [])
                        return }
                let movies = moviesDictionary.flatMap{Movie(dictionary: $0)}
                print(movies)
                completion(movies: movies)
            }
        }
    }
}






