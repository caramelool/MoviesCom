//
//  ViewController.swift
//  MoviesCom
//
//  Created by Lucas Caramelo on 16/10/17.
//  Copyright © 2017 Lucas Caramelo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FiltroControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    private var list : [Movie] = []
    
    private var morePage: Bool = false
    private var movieResponse: MovieResponse?
    private var filter: Filter = Filter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loading.startAnimating()
        requestMovieList()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count + (self.morePage ? 1 : 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == self.list.count){
            return self.loadTableView(tableView, cellForRowAt: indexPath)
        }
        return self.movieTableView(tableView, cellForRowAt: indexPath)
    }
    
    func movieTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie: Movie = self.list[indexPath.row]
        var cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as? MovieCell
        if (cell == nil) {
            cell = MovieCell(style: .default, reuseIdentifier: "movieCell")
        }
        cell!.bind(movie)
        return cell!
    }
    func loadTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "loadCell") as? LoadCell
        if (cell == nil) {
            cell = LoadCell(style: .default, reuseIdentifier: "loadCell")
        }
        cell?.loading.startAnimating()
        return cell!
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == self.list.count && morePage {
            requestMovieList()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == self.list.count ? 93 : 266
    }
    
    func didSelectFilter(_ filter: Filter) {
        if self.filter.value == filter.value {
            return
        }
        self.filter = filter
        movieResponse = nil
        morePage = false
        list.removeAll()
        tableView.reloadData()
        loading.startAnimating()
        requestMovieList()
    }
    
    func requestMovieList() {
        let page = (self.movieResponse?.page ?? 1) + 1
        let method = self.filter.value
        MovieRequest.get(method: method, page: page) { response in
            self.loading.stopAnimating()
            if (response == nil) {
                self.morePage = false
                return
            }
            self.movieResponse = response
            self.morePage = response!.page! > 0
            self.list.append(contentsOf: response!.results)
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "filterSegue" {
            let nav = segue.destination as? UINavigationController
            let controller = nav?.topViewController as? FilterController
            controller?.delegate = self
            controller?.currentFilter = filter
        } else if segue.identifier == "movieDetailSegue" {
            let controller = segue.destination as? MovieDetailController
            let movie = list[(tableView.indexPathForSelectedRow?.row)!]
            controller?.movie = movie
        }
    }
}

