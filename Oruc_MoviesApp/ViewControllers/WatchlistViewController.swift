//
//  WatchlistViewController.swift
//  Oruc_MoviesApp
//
//  Created by Oruj Dursunzade on 17.03.23.
//

import UIKit
import Kingfisher

class WatchlistViewController: UIViewController {
    
    @IBOutlet weak var watchlistTableView: UITableView!
    
    var watchList: [MovieModel] = [] {
        didSet {
            watchlistTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        watchlistTableView.delegate = self
        watchlistTableView.dataSource =  self
        watchlistTableView.register(UINib(nibName: "WatchlistTableViewCell", bundle: nil), forCellReuseIdentifier: "WatchlistTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.watchList = UserDefaultsHelper.shared.loadWatchList()
    }
}

// MARK: - Watch List Table View

extension WatchlistViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return watchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = watchlistTableView.dequeueReusableCell(withIdentifier: "WatchlistTableViewCell", for: indexPath) as! WatchlistTableViewCell
        let movie = watchList[indexPath.row]
        let watchlistItemImageUrl = URL(string: "\(movie.small_cover_image)")
        cell.watchlistItemImage.kf.setImage(with: watchlistItemImageUrl)
        cell.watchlistItemTitle.text = movie.title_english
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = watchList[indexPath.row]
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        vc.hidesBottomBarWhenPushed = true
        vc.movie = movie
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

