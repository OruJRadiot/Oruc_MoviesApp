//
//  TrendingMoviesTableViewCell.swift
//  Oruc_MoviesApp
//
//  Created by Oruj Dursunzade on 16.03.23.
//

import UIKit
import Kingfisher

protocol CollectionViewCellDelegate: AnyObject {
    func collectionView(collectionviewcell: UpcomingMovieItemCollectionViewCell?, index: Int, didTappedInTableViewCell: UpcomingMoviesTableViewCell, movie : MovieModel)

}


class UpcomingMoviesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var upcomingCollectionView: UICollectionView!
    
    weak var cellDelegate: CollectionViewCellDelegate?
    
    var moviesList: [MovieModel] = [] {
        didSet {
            upcomingCollectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        upcomingCollectionView.delegate = self
        upcomingCollectionView.dataSource = self
        upcomingCollectionView.register(UINib(nibName: "UpcomingMovieItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier : "UpcomingMovieItemCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}

extension UpcomingMoviesTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: "UpcomingMovieItemCollectionViewCell", for: indexPath) as! UpcomingMovieItemCollectionViewCell
        let movie = moviesList[indexPath.row]
        let imageUrl = URL(string: "\(movie.medium_cover_image)")
        cell.upcomingMovieItemImage.kf.setImage(with: imageUrl)
        cell.configureCell()
        return cell
    }
    
  
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = moviesList[indexPath.item]
        let cell = upcomingCollectionView.cellForItem(at: indexPath) as? UpcomingMovieItemCollectionViewCell
        self.cellDelegate?.collectionView(collectionviewcell: cell, index: indexPath.item, didTappedInTableViewCell: self, movie: movie)
    }

}
