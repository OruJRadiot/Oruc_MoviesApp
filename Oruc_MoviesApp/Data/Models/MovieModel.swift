//
//  MovieModel.swift
//  Oruc_MoviesApp
//
//  Created by Oruj Dursunzade on 18.03.23.
//

import Foundation

struct MovieModel : Codable, Equatable {
    let id : Int
    let title_english : String
    let year : Int
    let rating : Float
    let runtime : Int
    let genres : String?
    let summary : String
    let background_image : String
    let background_image_original : String
    let small_cover_image : String
    let medium_cover_image : String
    let large_cover_image : String
}
