//
//  MovieCell.swift
//  MovieFest
//
//  Created by Marcus Reuber Almeida Moraes Silva on 16/10/17.
//  Copyright © 2017 Marcus Reuber. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    func configMovieCell(withMovie: Movie){
        self.textLabel?.text = withMovie.title
        self.detailTextLabel?.text = withMovie.releaseDate
    }

}
