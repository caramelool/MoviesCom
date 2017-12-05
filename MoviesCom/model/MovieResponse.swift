//
//  MovieResponse.swift
//  MoviesCom
//
//  Created by Lucas Caramelo on 16/10/17.
//  Copyright © 2017 Lucas Caramelo. All rights reserved.
//

import UIKit

class MovieResponse : NSObject {
    var page : Int?
    var results : [Movie] = []
    var totalPages : Int?
    var totalResults: Int?
    
    init(_ dictionary:[String : AnyObject]) {
        page = dictionary["page"] as? Int ?? 0
        totalPages = dictionary["total_pages"] as? Int ?? 0
        totalResults = dictionary["total_results"] as? Int ?? 0
        
        let results = dictionary["results"] as? [[String : AnyObject]]
        for result in results! {
            let movie = Movie(result)
            self.results.append(movie)
        }
    }
}
