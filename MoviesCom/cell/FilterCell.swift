//
//  FiltroCell.swift
//  MoviesCom
//
//  Created by Lucas Caramelo on 19/10/17.
//  Copyright © 2017 Lucas Caramelo. All rights reserved.
//

import UIKit

class FilterCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }

    func bind(_ filter: Filter) {
        label.text = filter.name
    }
}
