//
//  MovieLibraryDataServiceTests.swift
//  MovieFestTests
//
//  Created by Marcus Reuber Almeida Moraes Silva on 16/10/17.
//  Copyright © 2017 Marcus Reuber. All rights reserved.
//

import XCTest

@testable import MovieFest

class MovieLibraryDataServiceTests: XCTestCase {
    var sut: MovieLibraryDataService!
    var tableView: UITableView!
    var movieLibraryVC: MovieLibraryViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        sut = MovieLibraryDataService()
        sut.movieManager = MovieManager()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        movieLibraryVC = storyboard.instantiateViewController(withIdentifier: "MovieLibraryVC") as! MovieLibraryViewController
        _ = movieLibraryVC.view
        
        tableView = movieLibraryVC.movieTableView
        tableView.dataSource = sut
        tableView.delegate = sut
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTableViewSectionCount_ShouldBeTwo() {
        
        let sectionCount = tableView.numberOfSections
        
        XCTAssertEqual(sectionCount, 2)
    }
    
    func testRowCountInSectionOne_ShouldEqualMoviesToSeeCount() {
        
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 5)
    }
    
    func testRowCountInSectiontwo_ShouldEqualMoviesSeenCount() {
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 0)
    }
    
    func testCellForRowAtIndex_ShouldReturnMovieCell() {
        sut.movieManager?.addMovieToLibrary(movie: Movie(title: "Horror"))
        tableView.reloadData()
        
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(cell is MovieCell)
    }
    
    func testCell_ShouldDequeueCell(){
        let tableViewMock = TableViewMock.initializeTableViewMock()
        tableViewMock.dataSource = sut
        
        
        sut.movieManager?.addMovieToLibrary(movie: Movie(title: "Sci-fi"))
        tableViewMock.reloadData()
        
        _ = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(tableViewMock.cellDequeuedProperly)
    }
    
    func testCellCinfig_ShouldSetData() {
        let tableViewMock = TableViewMock.initializeTableViewMock()
        tableViewMock.dataSource = sut
        
        let movie = Movie(title: "Suspense")
        
        sut.movieManager?.addMovieToLibrary(movie: movie)
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0)) as! MovieCellMock
        
        XCTAssertEqual(cell.movie, movie)
        
    }
    
    func testSectionTwo_ShouldSetCellWithFavoritedMovie() {
        let tableViewMock = TableViewMock.initializeTableViewMock()
        tableViewMock.dataSource = sut
        
        let movie1 = Movie(title: "Action")
        let movie2 = Movie(title: "Thriller")
        
        sut.movieManager?.addMovieToLibrary(movie: movie1)
        sut.movieManager?.addMovieToLibrary(movie: movie2)
        sut.movieManager?.favoriteMovieAtIndex(index: 0)
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 1)) as! MovieCellMock
        
        XCTAssertEqual(cell.movie, movie1)
        
    }
    
    func testFavoritingAMovie_ShouldFavoriteMovieOnCellSelect(){
        sut.movieManager?.addMovieToLibrary(movie: Movie(title: "Biography"))
        sut.movieManager?.addMovieToLibrary(movie: Movie(title: "Horror"))
        
        tableView.delegate?.tableView!(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(sut.movieManager?.moviesToSeeCount, 1)
        XCTAssertEqual(sut.movieManager?.moviesSeenCount, 1)
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)
    }
    
    func testTableViewSectionsTitles_ShouldHaveCorrectValues() {
        let section1Title = tableView.dataSource?.tableView!(tableView, titleForHeaderInSection: 0)
        let section2Title = tableView.dataSource?.tableView!(tableView, titleForHeaderInSection: 1)
        
        XCTAssertEqual(section1Title, "Movies To See")
        XCTAssertEqual(section2Title, "Movies Seen")
    }
    
}












