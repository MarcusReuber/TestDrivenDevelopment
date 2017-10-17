//
//  MovieCellTests.swift
//  MovieFestTests
//
//  Created by Marcus Reuber Almeida Moraes Silva on 17/10/17.
//  Copyright © 2017 Marcus Reuber. All rights reserved.
//

import XCTest

@testable import MovieFest

class MovieCellTests: XCTestCase {
    
    var tableView: UITableView!
    var dataSource: MockCellDataSource!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let movieLibraryVC = storyboard.instantiateViewController(withIdentifier: "MovieLibraryVC") as! MovieLibraryViewController
        _ = movieLibraryVC.view
        
        tableView = movieLibraryVC.movieTableView
        dataSource = MockCellDataSource()
        tableView.dataSource = dataSource
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCellConfig_ShouldSetLabelsToMovieData() {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellId", for: IndexPath(row: 0, section: 0)) as! MovieCell
        
        cell.configMovieCell(withMovie: Movie(title: "Adventure", releaseDate: "02/24/1898"))
        
        XCTAssertEqual(cell.textLabel?.text, "Adventure")
        XCTAssertEqual(cell.detailTextLabel?.text, "02/24/1898")
        
        
    }
    
}
