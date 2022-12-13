//
//  Service.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 28.11.2022.
//

import Foundation
import Alamofire

protocol MovieServiceProtocol {
    func fetchAllDatas(response: @escaping ([Result]?) -> ())
    func fetchAllDetails(movieId: Int, response: @escaping (MovieDetails?) -> ())
}

struct MovieService: MovieServiceProtocol {
    func fetchAllDatas(response: @escaping ([Result]?) -> ()) {
        AF.request(Constant.ServiceEndPoints.moviesServiceEndPoint(), method: .get).responseDecodable(of: Movies.self) { (model) in
            guard let data = model.value else {
                response(nil)
                return
            }
            response(data.results)
        }
    }

    func fetchAllDetails(movieId: Int, response: @escaping (MovieDetails?) -> ()) {
        AF.request(Constant.ServiceEndPoints.movieDetailsServiceEndPoint(movieId: movieId), method: .get)
            .responseDecodable(of: MovieDetails.self) { (model) in
            guard let data = model.value else {
                response(nil)
                return
            }
            response(data)
        }
    }
}
