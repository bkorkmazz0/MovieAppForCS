//
//  MovieDetailModel.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 28.11.2022.
//

import Foundation

// MARK: - Movie Details
struct MovieDetails: Codable {
    let genres: [Genre]?
    let homepage: String?
    let imdbID, overview: String?
    let posterPath: String?
    let releaseDate: String?
    let tagline, title: String?
    let voteAverage: Double?

    enum CodingKeys: String, CodingKey {
        case genres
        case homepage = "homepage"
        case imdbID = "imdb_id"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case tagline, title
        case voteAverage = "vote_average"
    }
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int?
    let name: String?
}
