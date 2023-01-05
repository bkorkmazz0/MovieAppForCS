//
//  MovieServiceService.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 28.11.2022.
//

import Foundation
import Alamofire

protocol MovieServiceProtocol {
    func fetchAllMovies(page: Int, response: @escaping ([Result]?) -> ())
    func fetchAllMovieDetails(movieId: Int, response: @escaping (MovieDetails?) -> ())
}
#warning("//TODO: - Split service page to Movie and MovieDetail, and write service manager in Utilities folder.")
final class MovieService: MovieServiceProtocol {

    // MARK: - fetchAllMovies
    func fetchAllMovies(page: Int, response: @escaping ([Result]?) -> ()) {
        AF.request(ServiceEndpoints.movieService(page: page)).validate().responseDecodable(of: Movies.self) { model in
            guard let data = model.value else {
                response(nil)
                return
            }
            response(data.results)
        }
    }

    // MARK: - fetchAllMovieDetails
    func fetchAllMovieDetails(movieId: Int, response: @escaping (MovieDetails?) -> ()) {
        AF.request(ServiceEndpoints.movieDetailService(movieId: movieId))
            .validate().responseDecodable(of: MovieDetails.self) { model in
            guard let data = model.value else {
                response(nil)
                return
            }
            response(data)
        }
    }
}
