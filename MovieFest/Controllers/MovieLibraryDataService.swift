//
//  MovieLibraryDataService.swift
//  MovieFest
//
//  Created by Marcus Reuber Almeida Moraes Silva on 16/10/17.
//  Copyright © 2017 Marcus Reuber. All rights reserved.
//

import UIKit

enum LibrarySection: Int {
    case MoviesToSee, MoviesSeen
}

class MovieLibraryDataService: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var movieManager: MovieManager?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let movieManager = movieManager else {return 0}
        
        guard let librarySection = LibrarySection(rawValue: section) else { fatalError() }
        
        switch librarySection {
        case .MoviesToSee:
            return movieManager.moviesToSeeCount
        case .MoviesSeen:
            return movieManager.moviesSeenCount
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellId", for: indexPath) as! MovieCell
        
        guard let movieManager = movieManager else {fatalError()}
        guard let librarySection = LibrarySection(rawValue: indexPath.section) else {fatalError()}
        
        let currentMovie = librarySection.rawValue == 0 ? movieManager.movieAtIndex(index: indexPath.row) : movieManager.favoritedMovieAtIndex(index: indexPath.row)
        
        cell.configMovieCell(withMovie: currentMovie)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movieManager = movieManager else { fatalError() }
        guard let librarySection = LibrarySection(rawValue: indexPath.section) else{ fatalError() }
        
        if librarySection == .MoviesToSee {
            movieManager.favoriteMovieAtIndex(index: indexPath.row)
            tableView.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let librarySection = LibrarySection(rawValue: section) else { fatalError() }
        
        let sectionTitle: String
        switch librarySection {
        case .MoviesToSee:
            sectionTitle = "Movies To See"
        case .MoviesSeen:
            sectionTitle = "Movies Seen"
        }
        
        return sectionTitle
    }
    
}
