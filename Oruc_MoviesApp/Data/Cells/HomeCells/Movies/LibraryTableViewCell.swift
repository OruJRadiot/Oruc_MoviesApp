//
//  LibraryTableViewCell.swift
//  Oruc_MoviesApp
//
//  Created by Oruj Dursunzade on 17.03.23.
//

import UIKit

protocol LibraryCollectionViewCellDelegate: AnyObject {
    func libraryCollectionView(collectionviewcell: LibraryCollectionViewCell?, index: Int, didTappedInTableViewCell: LibraryTableViewCell, movie : MovieModel)
}

class LibraryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var libraryCollectionView: UICollectionView!
    @IBOutlet weak var libraryHeightConstraint: NSLayoutConstraint!
    
    weak var cellDelegate: LibraryCollectionViewCellDelegate?
    
    var moviesList: [MovieModel] = [] {
        didSet {
            libraryCollectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        libraryCollectionView.delegate = self
        libraryCollectionView.dataSource = self
        libraryCollectionView.register(UINib(nibName: "LibraryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier : "LibraryCollectionViewCell")
        configureLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configureLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        layout.minimumInteritemSpacing = 12
        layout.minimumLineSpacing = 15
        layout.scrollDirection = .vertical
        let currentScreenWidth =  UIScreen.main.bounds.width
        let itemWidth = (currentScreenWidth - 64) / 3
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth*1.6)
        libraryCollectionView.collectionViewLayout = layout
    }
    
}

extension LibraryTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = libraryCollectionView.dequeueReusableCell(withReuseIdentifier: "LibraryCollectionViewCell", for: indexPath) as! LibraryCollectionViewCell
        let movie = moviesList[indexPath.row]
        let imageUrl = URL(string: "\(movie.medium_cover_image)")
        cell.libraryMovieItemImage.kf.setImage(with: imageUrl)
        cell.configureCell()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = moviesList[indexPath.item]
        let cell = libraryCollectionView.cellForItem(at: indexPath) as? LibraryCollectionViewCell
        self.cellDelegate?.libraryCollectionView(collectionviewcell: cell, index: indexPath.item, didTappedInTableViewCell: self, movie: movie)
    }
    
    
}
