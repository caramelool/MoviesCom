//
//  FiltroViewController.swift
//  MoviesCom
//
//  Created by Lucas Caramelo on 17/10/17.
//  Copyright © 2017 Lucas Caramelo. All rights reserved.
//

import UIKit

protocol FiltroControllerDelegate {
    func didSelectFilter(_ filter: Filter)
}

class FilterController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var delegate: FiltroControllerDelegate?
    var currentFilter: Filter?
    private var filterList: [Filter] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterList.append(Filter(name: "Em Cartaz", value: MovieMethodEnum.NowPlaying))
        filterList.append(Filter(name: "Popular", value: MovieMethodEnum.Popular))
        filterList.append(Filter(name: "Mais Votados", value: MovieMethodEnum.TopRated))
        filterList.append(Filter(name: "Próximos", value: MovieMethodEnum.Upcoming))
    }
    
    @IBAction func actionDismiss(_ sender: Any) {
        navigationController?.dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let filter = filterList[indexPath.row]
        var cell = tableView.dequeueReusableCell(withIdentifier: "filterCell") as? FilterCell
        if (cell == nil) {
            cell = FilterCell(style: .default, reuseIdentifier: "filterCell")
        }
        cell?.bind(filter)
        cell?.accessoryType = (filter.value == currentFilter?.value) ? .checkmark : .none
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let filter = filterList[indexPath.row]
        if filter.value == currentFilter?.value {
            return
        }
        navigationController?.dismiss(animated: true) {
            self.delegate?.didSelectFilter(filter)
        }
    }
}
