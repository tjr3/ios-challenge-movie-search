//
//  MoviesTableViewController.swift
//  MovieSearch
//
//  Created by Tyler on 6/3/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController, UISearchBarDelegate {

 
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        
        MovieController.searchForMovieWithSearchTerm(searchTerm) { (movies) in
            self.movies = movies
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tableView.reloadData()
            })
    }
    }
    
    
//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(true)
//        MovieController.sharedController.searchForMovieWithSearchTerm("Star Wars") { (movies) in
//            dispatch_async(dispatch_get_main_queue(), { 
//                self.movies = movies
//                print(movies[0].title)
//                self.tableView.reloadData()
//            })
//        }
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("movieCell", forIndexPath: indexPath) as? MovieTableViewCell
        
        cell?.updateMovie(movies[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
}