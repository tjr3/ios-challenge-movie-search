//
//  Movie.swift
//  MovieSearch
//
//  Created by Tyler on 6/10/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

class Movie {
    
    let title: String
    let rating: Double
    let summary: String
    let imageEndpoint: String
    
    
    // Value to Key Dictionary
    init?(dicitonary: [String:AnyObject]) {
        guard let title = dicitonary["title"] as? String,
            rating = dicitonary["vote_average"] as? Double,
            summary = dicitonary["overview"] as? String,
            imageEndpoint = dicitonary["poster_path"] as? String else { return nil }
        
        
        self.title = title
        self.rating = rating
        self.summary = summary
        self.imageEndpoint = imageEndpoint
        
    }
    
    
}
