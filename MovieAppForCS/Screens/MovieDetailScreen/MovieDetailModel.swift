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
    let imdbID: String?
    let overview: String?
    let posterPath: String?
    let releaseDate: String?
    let tagline: String?
    let title: String?
    let voteAverage: Double?

    enum CodingKeys: String, CodingKey {
        case genres
        case homepage = "homepage"
        case imdbID = "imdb_id"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case tagline
        case title
        case voteAverage = "vote_average"
    }

    var _homepage: String {
        homepage ?? "N/A"
    }

    var _imdbID: String {
        imdbID ?? "N/A"
    }

    var _overview: String {
        if overview == "" {
            return "There is no overview!"
        } else {
            return overview ?? "N/A"
        }
    }

    var _posterPath: String {
        posterPath ?? ""
    }

    var _releaseDate: String {
        releaseDate ?? "N/A"
    }

    var _tagline: String {
        if tagline == "" {
            return "There is no tagline!"
        } else {
            return tagline ?? "N/A"
        }
    }

    var _title: String {
        title ?? "N/A"
    }
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int?
    let name: String?

    var _id: Int {
        id ?? Int.min
    }

    var _name: String {
        name ?? "N/A"
    }
}
