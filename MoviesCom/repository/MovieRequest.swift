 //
//  MovieRequest.swift
//  MoviesCom
//
//  Created by Lucas Caramelo on 16/10/17.
//  Copyright © 2017 Lucas Caramelo. All rights reserved.
//

import Foundation
import Alamofire

class MovieRequest {
    
    private static let API_KEY : NSString = "d7378b8d8f3194315f9163bd01782a7b"
    
    public static func get(method: MovieMethodEnum = MovieMethodEnum.Popular, page: Int = 1, complete:@escaping (MovieResponse?) -> Void) {
        let url = "http://api.themoviedb.org/3/movie/\(method.rawValue)?api_key=\(MovieRequest.API_KEY)&page=\(page)"
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
                case .success:
                    if let json = response.result.value as? [String : AnyObject] {
                        let movieResponse = MovieResponse(json)
                        complete(movieResponse)
                    }
                case .failure:
                    complete(nil)
            }
        }
    }
}
 
enum MovieMethodEnum : String {
    case Popular = "popular"
    case NowPlaying = "now_playing"
    case TopRated = "top_rated"
    case Upcoming = "upcoming"
}

 
