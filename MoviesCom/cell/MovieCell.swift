//
//  MovieCell.swift
//  MoviesCom
//
//  Created by Lucas Caramelo on 17/10/17.
//  Copyright © 2017 Lucas Caramelo. All rights reserved.
//

import UIKit
import SDWebImage

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func bind(_ movie: Movie) {
        let postPath = URL(string: "https://image.tmdb.org/t/p/original\(movie.posterPath!)")
        titleLabel.text = movie.title
        posterImageView.sd_setImage(with: postPath, placeholderImage: UIImage(named: "movie-placeholder.png"))
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }
}
