//
//  MovieData.swift
//  Oruc_MoviesApp
//
//  Created by Oruj Dursunzade on 18.03.23.
//

import Foundation

struct MovieData : Codable {
    let data : filmData
}

struct filmData : Codable {
    let movie_count : Int
    let movies : [Movie]
}

struct Movie : Codable {
    let id : Int
    let title_english : String
    let year : Int
    let rating : Float
    var runtime : Int
    let genres : [String]
    let summary : String
    let background_image : String
    let background_image_original : String
    let small_cover_image : String
    let medium_cover_image : String
    let large_cover_image : String
    
}
