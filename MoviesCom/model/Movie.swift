//
//  Movie.swift
//  MoviesCom
//
//  Created by Lucas Caramelo on 16/10/17.
//  Copyright © 2017 Lucas Caramelo. All rights reserved.
//

import Foundation

class Movie {
 
    var adult: Bool = false
    var backdropPath: String?
    var genre_ids: [Int] = []
    var id: Int?
    var originalLanguage: String?
    var originalTitle: String?
    var overview: String?
    var popularity: Double?
    var posterPath: String?
    var releaseDate: String?
    var title: String?
    var video: Bool = false
    var voteAverage: Double?
    var voteCount: Int?
    
    init(_ dictionary:[String : AnyObject]) {
        adult = dictionary["adult"] as? Bool ?? false
        backdropPath = dictionary["backdrop_path"] as? String ?? ""
        genre_ids = dictionary["genre_ids"] as? [Int] ?? []
        id = dictionary["id"] as? Int ?? 0
        originalLanguage = dictionary["original_language"] as? String ?? ""
        originalTitle = dictionary["original_title"] as? String ?? ""
        overview = dictionary["overview"] as? String ?? ""
        popularity = dictionary["popularity"] as? Double ?? 0.0
        posterPath = dictionary["poster_path"] as? String ?? ""
        releaseDate = dictionary["release_date"] as? String ?? ""
        title = dictionary["title"] as? String ?? ""
        video = dictionary["video"] as? Bool ?? false
        voteAverage = dictionary["vote_average"] as? Double ?? 0.0
        voteCount = dictionary["vote_count"] as? Int ?? 0
    }
}
