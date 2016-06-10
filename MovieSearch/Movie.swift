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
    
    private let kTitle = "title"
    private let kRating = "vote_average"
    private let kSummary = "overview"
    private let kImage = "poster_path"
    
    let title: String
    let rating: Double
    let summary: String
    let imageEndpoint: String
    
    
    // Value to Key Dictionary
    init?(dicitonary: [String:AnyObject]) {
        guard let title = dicitonary[kTitle] as? String,
            rating = dicitonary[kRating] as? Double,
            summary = dicitonary[kSummary] as? String,
            imageEndpoint = dicitonary[kImage] as? String else { return nil }
        
        self.title = title
        self.rating = rating
        self.summary = summary
        self.imageEndpoint = imageEndpoint
        
    }
    
    
}
