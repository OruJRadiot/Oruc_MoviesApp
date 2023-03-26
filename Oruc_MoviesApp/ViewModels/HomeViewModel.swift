//
//  HomeViewModel.swift
//  Oruc_MoviesApp
//
//  Created by Oruj Dursunzade on 18.03.23.
//

import Foundation

class HomeViewModel {
    
    private let movieURL = "https://yts.mx/api/v2/list_movies.json?sort=seeds&limit=15"
    
    func performRequest (completion: @escaping ([MovieModel]) -> ()) {
        let urlString = "https://yts.mx/api/v2/list_movies.json?sort=seeds&limit=15"
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!.localizedDescription)
                    return
                }
                if let safeData = data {
                    if let movies = self.parseJSON(movieData: safeData) {
                        completion(movies)
                    }
                }
            }
            task.resume()
        }
    }
    
    func searchRequest (searchText: String, completion: @escaping ([MovieModel]) -> ()) {
        let urlString = "https://yts.mx/api/v2/list_movies.json?query_term=\(searchText)"
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("Nothing found")
                    return
                }
                if let safeData = data {
                    if let movies = self.parseJSON(movieData: safeData) {
                        completion(movies)
                    }
                }
            }
            task.resume()
        }
    }
    
    
    
    func parseJSON(movieData : Data) -> [MovieModel]? {
        var movies : [MovieModel] = []
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(MovieData.self, from: movieData)
//            print(decodedData.data.movies[0].title_english)
//            print(decodedData.data.movies[0].year)
//            print(decodedData.data.movies[0].rating)
//            print(decodedData.data.movies[0].runtime)
            
            for movie in decodedData.data.movies {
                let id = movie.id
                let title_english = movie.title_english
                let year = movie.year
                let rating = movie.rating
                let runtime = movie.runtime
                let genre = movie.genres[0]
                let summary = movie.summary
                let background_image = movie.background_image
                let background_image_original = movie.background_image_original
                let small_cover_image = movie.small_cover_image
                let medium_cover_image = movie.medium_cover_image
                let large_cover_image = movie.large_cover_image
                
                let movie = MovieModel(id: id, title_english: title_english, year: year, rating: rating, runtime: runtime, genres: genre, summary: summary, background_image: background_image, background_image_original: background_image_original, small_cover_image: small_cover_image, medium_cover_image: medium_cover_image, large_cover_image: large_cover_image)
                
                movies.append(movie)
            }
            return movies
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    
    
}

//Aykhan search api https://yts.mx/api/v2/list_movies.json?query_term=
