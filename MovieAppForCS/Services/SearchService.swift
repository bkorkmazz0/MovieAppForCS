//
//  SearchService.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 29.01.2023.
//

import Foundation
import Alamofire

protocol SearchServiceProtocol {
    func searchMovies(searchMovieName: String, response: @escaping ([Search]?) -> ())
}

final class SearchService: SearchServiceProtocol {

    // MARK: - searchMovies
    func searchMovies(searchMovieName: String, response: @escaping ([Search]?) -> ()) {
        AF.request(ServiceEndpoints.searchMovies(searchMovieName: searchMovieName)).validate().responseDecodable(of: SearchModel.self) { model in
            guard let data = model.value else {
                response(nil)
                return
            }
            response(data.results)
        }
    }
}
