//
//  ViewController.swift
//  Oruc_MoviesApp
//
//  Created by Oruj Dursunzade on 16.03.23.
//

import UIKit

class HomeViewController: UIViewController, CollectionViewCellDelegate, LibraryCollectionViewCellDelegate {

    @IBOutlet weak var tableView: UITableView!
    var viewModel = HomeViewModel()
    private var movieList: [MovieModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.backgroundColor = UIColor(named: "bg-nav")
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = UIColor(named: "bg-main")
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.barStyle = .black
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.compactAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "UpcomingMoviesTableViewCell", bundle: nil), forCellReuseIdentifier: "UpcomingMoviesTableViewCell")
        tableView.register(UINib(nibName: "LibraryTableViewCell", bundle: nil), forCellReuseIdentifier: "LibraryTableViewCell")
        
        viewModel.performRequest { movieList in
            self.movieList = movieList
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        searchField.text = ""
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: animated)
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: animated)
//    }
    
}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let upcomingCell = tableView.dequeueReusableCell(withIdentifier: "UpcomingMoviesTableViewCell", for: indexPath) as! UpcomingMoviesTableViewCell
            upcomingCell.moviesList = movieList
            upcomingCell.cellDelegate = self
            return upcomingCell
        }
        if indexPath.row == 1 {
            let libraryCell = tableView.dequeueReusableCell(withIdentifier: "LibraryTableViewCell", for: indexPath) as! LibraryTableViewCell
            libraryCell.moviesList = movieList
            libraryCell.cellDelegate = self
            return libraryCell
        }
        return UITableViewCell()
        
    }
    
    func collectionView(collectionviewcell: UpcomingMovieItemCollectionViewCell?, index: Int, didTappedInTableViewCell: UpcomingMoviesTableViewCell, movie: MovieModel) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        vc.hidesBottomBarWhenPushed = true
        vc.movie = movie
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func libraryCollectionView(collectionviewcell: LibraryCollectionViewCell?, index: Int, didTappedInTableViewCell: LibraryTableViewCell, movie: MovieModel) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        vc.hidesBottomBarWhenPushed = true
        vc.movie = movie
        navigationController?.pushViewController(vc, animated: true)
    }

}


