//
//  MovieDetailController.swift
//  MoviesCom
//
//  Created by Lucas Caramelo on 19/10/17.
//  Copyright © 2017 Lucas Caramelo. All rights reserved.
//

import UIKit

class MovieDetailController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    var movie: Movie?
    
    override func viewDidLoad() {
        let postPath = URL(string: "https://image.tmdb.org/t/p/original\(movie!.posterPath!)")
        image.sd_setImage(with: postPath, placeholderImage: UIImage(named: "movie-placeholder.png"))
        titleLabel.text = movie!.title
        descriptionLabel.text = movie!.overview
    }
}

