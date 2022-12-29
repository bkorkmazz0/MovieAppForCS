//
//  MovieModel.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 28.11.2022.
//

import Foundation

// MARK: - Movies
struct Movies: Codable {
    let results: [Result]?
}

// MARK: - Result
struct Result: Codable {
    let id: Int?
    let posterPath, releaseDate, title: String?
    let voteAverage: Double?

    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
    }
    
    var _id: Int {
        id ?? Int.min
    }
    
    var _posterPath: String {
        posterPath ?? "N/A"
    }
    
    var _title: String {
        title ?? "N/A"
    }

    var _releaseDate: String {
        releaseDate ?? "N/A"
    }
}
