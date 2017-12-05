//
//  Filtro.swift
//  MoviesCom
//
//  Created by Lucas Caramelo on 19/10/17.
//  Copyright © 2017 Lucas Caramelo. All rights reserved.
//

import Foundation

class Filter {
    var name: String = ""
    var value: MovieMethodEnum = .NowPlaying
    
    init() {}
    
    init(name: String, value: MovieMethodEnum) {
        self.name = name
        self.value = value
    }
}
