//
//  SearchViewController.swift
//  Oruc_MoviesApp
//
//  Created by Oruj Dursunzade on 17.03.23.
//

import UIKit

class SearchViewController: UIViewController{
    
    @IBOutlet weak var discoverField: UISearchBar!
    @IBOutlet weak var searchTableView: UITableView!
    
    var viewModel = HomeViewModel()
    private var searchList: [MovieModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        discoverField.searchBarStyle = .minimal
        discoverField.barStyle = .black
        discoverField.searchTextField.leftView?.tintColor = .white
        discoverField.placeholder = "Discover our collection"
        discoverField.searchTextPositionAdjustment = UIOffset(horizontal: 15, vertical: 0)
        discoverField.delegate = self
        
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.register(UINib(nibName: "SearchTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchTableViewCell")
        searchTableView.register(UINib(nibName: "NoSearchResultTableViewCell", bundle: nil), forCellReuseIdentifier: "NoSearchResultTableViewCell")
    }

}

// MARK: - Search Result List

extension SearchViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchList.count > 0 {
            return searchList.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if searchList.count == 0 {
            let cell = searchTableView.dequeueReusableCell(withIdentifier: "NoSearchResultTableViewCell", for: indexPath) as! NoSearchResultTableViewCell
            searchTableView.rowHeight = 280
            return cell
        }
        if searchList.count >= 1 {
            let cell = searchTableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
            searchTableView.rowHeight = 180
            let movie = searchList[indexPath.row]
            
            let imageUrl = URL(string: "\(movie.medium_cover_image)")
            cell.movieImage.kf.setImage(with: imageUrl)
            
            cell.movieTitle.text = movie.title_english
            cell.movieRating.text = String(movie.rating)
            cell.movieYear.text = String(movie.year)
            cell.movieGenre.text = movie.genres
            cell.movieRuntime.text = movie.runtime > 0 ? "\(movie.runtime) minutes" : "not available"
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = searchList[indexPath.row]
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        vc.hidesBottomBarWhenPushed = true
        vc.movie = movie
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension SearchViewController : UISearchBarDelegate {    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if discoverField.text!.count < 3 {
            self.searchList = []
            DispatchQueue.main.async {
                self.searchTableView.reloadData()
            }
        } else {
            if let userTypedText = discoverField.text {
                viewModel.searchRequest(searchText: userTypedText) { movieList in
                    self.searchList = movieList
                    DispatchQueue.main.async {
                        self.searchTableView.reloadData()
                    }
                }
            }
        }

    }
}

