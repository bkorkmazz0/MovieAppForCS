//
//  APIURLs.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 28.11.2022.
//

import Foundation

enum ServiceEndpoints: String {
    case BASE_URL = "https://api.themoviedb.org/3/"
    case BASE_IMAGE_URL = "https://image.tmdb.org/t/p/w500/"
    case API_KEY = "api_key=91aababb6f421b20a53355a3944b9edb"
    case IMDB_URL = "https://www.imdb.com/title/"

    static func movieService(page: Int) -> String {
        "\(BASE_URL.rawValue)movie/popular?\(API_KEY.rawValue)&language=en-US&page=\(page)"
    }

    static func imageURL(posterPath: String) -> String {
        "\(BASE_IMAGE_URL.rawValue)\(posterPath)"
    }

    static func movieDetailService(movieId: Int) -> String {
        "\(BASE_URL.rawValue)movie/\(movieId)?\(API_KEY.rawValue)"
    }
}
