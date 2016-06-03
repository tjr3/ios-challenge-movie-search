//
//  Movie.swift
//  MovieSearch
//
//  Created by Tyler on 6/3/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

class Movie {
    
    let title: String
    let rating: Int
    let overview: String
    let imageEndpoint: String
    
    init?(dictionary: [String:AnyObject]) {
        guard let title = dictionary ["title"] as? String,
            rating = dictionary ["vote_average"] as? Int,
            overview = dictionary ["overview"] as? String,
            imageEndpoint = dictionary ["poster_path"] as? String else {
                return nil
        }
        
        self.title = title
        self.rating = rating
        self.overview = overview
        self.imageEndpoint = imageEndpoint
    }
    
    
}
