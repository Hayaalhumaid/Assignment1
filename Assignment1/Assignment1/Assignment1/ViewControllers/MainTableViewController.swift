//
//  ViewController.swift
//  Assignment1
//
//  Created by Haya Alhumaid on 9/3/19.
//  Copyright © 2019 HayaAlhumaid. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    //MARK:- Interface Builder
    
    //MARK:- Properties
    var movieList = [Movie]()
    var selectedMovie: Movie?
    
    //MARK:- Viewcontroller's LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchMovieListFromServer()
    }
    
    //MARK:- Methods
    func fetchMovieListFromServer() {
        NetworkServices.fetchMovieList { (result) in
            switch result {
            case .success(let movieData):
                self.movieList = movieData.results
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
                print("Errorfetching data from server!")
            }
        }
    }
    
}

//MARK:- TableView Datasource and Delegate Methods
extension MainTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        cell.loadMovieData(movie: self.movieList[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.selectedMovie = self.movieList[indexPath.row]
        self.performSegue(withIdentifier: "ListToDetail", sender: self)
    }
}

//MARK:-Segue
extension MainTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ListToDetail" {
            let detailVC = segue.destination as! DetailViewController
            detailVC.selectedMovie = self.selectedMovie
        }
    }
}

