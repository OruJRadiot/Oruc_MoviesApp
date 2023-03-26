//
//  SearchTableViewCell.swift
//  Oruc_MoviesApp
//
//  Created by Oruj Dursunzade on 17.03.23.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieImage : UIImageView!
    @IBOutlet weak var movieTitle : UILabel!
    @IBOutlet weak var movieRating : UILabel!
    @IBOutlet weak var movieGenre : UILabel!
    @IBOutlet weak var movieYear : UILabel!
    @IBOutlet weak var movieRuntime : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
