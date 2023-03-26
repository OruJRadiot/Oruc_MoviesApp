//
//  WatchlistTableViewCell.swift
//  Oruc_MoviesApp
//
//  Created by Oruj Dursunzade on 18.03.23.
//

import UIKit

class WatchlistTableViewCell: UITableViewCell {
    
    @IBOutlet weak var watchlistItemImage : UIImageView!
    @IBOutlet weak var watchlistItemTitle : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
