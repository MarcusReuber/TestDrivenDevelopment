//
//  Movie.swift
//  MovieFest
//
//  Created by Marcus Reuber Almeida Moraes Silva on 16/10/17.
//  Copyright © 2017 Marcus Reuber. All rights reserved.
//

import Foundation

struct Movie: Equatable{
    let title: String
    let releaseDate: String?
    
    init(title: String, releaseDate: String? = nil){
        self.title = title
        self.releaseDate = releaseDate
    }
}

func ==(lhs: Movie, rhs: Movie) -> Bool {
    if lhs.title != rhs.title {
        return false
    }
    
    if lhs.releaseDate != rhs.releaseDate {
        return false
    }
    
    return true
}
