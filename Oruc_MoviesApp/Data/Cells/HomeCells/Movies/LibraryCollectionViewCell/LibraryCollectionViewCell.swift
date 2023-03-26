//
//  LibraryCollectionViewCell.swift
//  Oruc_MoviesApp
//
//  Created by Oruj Dursunzade on 17.03.23.
//

import UIKit

class LibraryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var libraryMovieItemImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell() {
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor(named: "library-cell-border-color")?.cgColor
//        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = 10
    }

}
