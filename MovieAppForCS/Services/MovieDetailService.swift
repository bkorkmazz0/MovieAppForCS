//
//  MovieDetailService.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 8.01.2023.
//

import Foundation
import Alamofire

protocol MovieDetailServiceProtocol {
    func fetchAllMovieDetails(movieId: Int, response: @escaping (MovieDetails?) -> ())
}

final class MovieDetailService: MovieDetailServiceProtocol {

    // MARK: - fetchAllMovieDetails
    func fetchAllMovieDetails(movieId: Int, response: @escaping (MovieDetails?) -> ()) {
        AF.request(ServiceEndpoints.movieDetailService(movieId: movieId)).validate().responseDecodable(of: MovieDetails.self) { model in
            guard let data = model.value else {
                response(nil)
                return
            }
            response(data)
        }
    }
}
