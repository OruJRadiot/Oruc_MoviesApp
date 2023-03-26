//
//  DetailsViewController.swift
//  Oruc_MoviesApp
//
//  Created by Oruj Dursunzade on 17.03.23.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var descriptionTextField: UITextView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    @IBOutlet weak var addToWatchListBtn: UIBarButtonItem!
    
    var movie : MovieModel? = nil
    var movieStatus : Bool = false {
        didSet {
            toggleWatchlistBtnImage()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryLabel.text = movie!.genres
        descriptionTextField.text = movie!.summary
        durationLabel.text = movie!.runtime > 0 ? "\(movie!.runtime) minutes" : "unavailable"
        
        let headerImageUrl = URL(string: "\(movie!.large_cover_image)")
        headerImage.kf.setImage(with: headerImageUrl)
        let posterImageUrl = URL(string: "\(movie!.medium_cover_image)")
        posterImage.kf.setImage(with: posterImageUrl)
        
        titleLabel.text = movie!.title_english
        yearLabel.text = String(movie!.year)
        ratingLabel.text = String(movie!.rating)
        movieStatus = UserDefaultsHelper.shared.checkMovieStatus(movieId: movie!.id)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    
    @IBAction func toggleWatchlistItem(_ sender: UIBarButtonItem) {
        if movieStatus == false{
            UserDefaultsHelper.shared.addToWatchList(movie!)
            movieStatus = !movieStatus
        }else {
            UserDefaultsHelper.shared.removeFromWatchlist(movieId: movie!.id)
            movieStatus = !movieStatus
        }
    }
    
    func toggleWatchlistBtnImage () {
        if movieStatus == false{
            addToWatchListBtn.setBackgroundImage(UIImage(systemName: "heart"), for: .normal, style: .plain, barMetrics: .default)
        }else {
            addToWatchListBtn.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal, style: .plain, barMetrics: .default)
        }
    }


}
