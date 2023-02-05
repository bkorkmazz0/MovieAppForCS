//
//  SearchModel.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 29.01.2023.
//

import Foundation

//MARK: - Welcome
struct SearchModel: Codable {
    let results: [Search]?
}

// MARK: - Search
struct Search: Codable {
    let id: Int?
    let posterPath: String?
    let releaseDate: String?
    let title: String?
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
        posterPath ?? ""
    }

    var _title: String {
        title ?? "N/A"
    }

    var _releaseDate: String {
        releaseDate ?? "N/A"
    }
}
