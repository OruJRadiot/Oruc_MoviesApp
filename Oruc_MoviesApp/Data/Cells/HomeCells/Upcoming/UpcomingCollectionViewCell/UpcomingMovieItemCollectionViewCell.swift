//
//  UpcomingMovieItemCollectionViewCell.swift
//  Oruc_MoviesApp
//
//  Created by Oruj Dursunzade on 16.03.23.
//

import UIKit

class UpcomingMovieItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var upcomingMovieItemImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell (){
        self.layer.borderWidth = 4
        self.layer.borderColor = UIColor(named: "upcoming-cell-border-color")?.cgColor
        self.layer.cornerRadius = 15
    }
}
