//
//  LoadCell.swift
//  MoviesCom
//
//  Created by Lucas Caramelo on 17/10/17.
//  Copyright © 2017 Lucas Caramelo. All rights reserved.
//

import UIKit

class LoadCell: UITableViewCell {

    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }

}
