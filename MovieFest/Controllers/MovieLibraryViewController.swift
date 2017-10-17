//
//  ViewController.swift
//  MovieFest
//
//  Created by Marcus Reuber Almeida Moraes Silva on 10/10/17.
//  Copyright © 2017 Marcus Reuber. All rights reserved.
//

import UIKit
import ChameleonFramework

class MovieLibraryViewController: UIViewController {

    @IBOutlet weak var movieTableView: UITableView!
    
    @IBOutlet var dataService: MovieLibraryDataService!
    
    var movieManager = MovieManager()
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = GradientColor(.radial, frame: self.view.frame, colors: [UIColor.flatSkyBlue, UIColor.flatNavyBlue])
        
        self.movieTableView.dataSource = dataService
        self.movieTableView.delegate = dataService
        
        dataService.movieManager = movieManager
        
        dataService.movieManager?.addMovieToLibrary(movie: Movie(title: "Action", releaseDate: "02/03/1999"))
        dataService.movieManager?.addMovieToLibrary(movie: Movie(title: "Adventure", releaseDate: "02/03/2004"))
        dataService.movieManager?.addMovieToLibrary(movie: Movie(title: "Suspense", releaseDate: "02/03/2005"))
        dataService.movieManager?.addMovieToLibrary(movie: Movie(title: "Thriller", releaseDate: "02/03/2006"))
        dataService.movieManager?.addMovieToLibrary(movie: Movie(title: "Sci-fi", releaseDate: "02/03/2007"))
        
        self.movieTableView.reloadData()
        
    }

}

