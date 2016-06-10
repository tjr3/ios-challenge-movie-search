//
//  MovieTableViewCell.swift
//  MovieSearch
//
//  Created by Tyler on 6/9/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var movieImagView: UIImageView!
    
    
    func updateMovie(movie: Movie) {
        titleLabel.text = movie.title
        ratingLabel.text = "\(movie.rating)"
        summaryLabel.text = movie.overview
        print(movie.imageEndpoint)
        let imageURL = "http://image.tmdb.org/t/p/w500" + "\(movie.imageEndpoint)"
        ImageController.imageForURL(imageURL) { (image) in
            if let image = image {
                self.movieImagView.image = image
            }
        }
        
    }
    
     override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
