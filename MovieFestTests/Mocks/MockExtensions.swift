//
//  MockExtensions.swift
//  MovieFestTests
//
//  Created by Marcus Reuber Almeida Moraes Silva on 17/10/17.
//  Copyright © 2017 Marcus Reuber. All rights reserved.
//

import Foundation
import UIKit

@testable import MovieFest

extension MovieLibraryDataServiceTests {
    class TableViewMock: UITableView {
        var cellDequeuedProperly: Bool = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellDequeuedProperly = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
        
        class func initializeTableViewMock() -> TableViewMock {
            let tableViewMock = TableViewMock(frame: CGRect.init(x: 0, y: 0, width: 300, height: 500), style: .plain)
            tableViewMock.register(MovieCellMock.self, forCellReuseIdentifier: "movieCellId")
            
            return tableViewMock
        }
    }
    
    class MovieCellMock: MovieCell {
        var movie: Movie?
        
        override func configMovieCell(withMovie: Movie){
            movie = withMovie
        }
    }
}

extension MovieCellTests {
    class MockCellDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
        
        
    }
}


