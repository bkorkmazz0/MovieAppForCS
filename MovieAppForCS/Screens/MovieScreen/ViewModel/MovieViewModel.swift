//
//  MovieViewModel.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 28.11.2022.
//

import Foundation

protocol MovieProtocol {
    func fetchDatas()
    func fetchDetails(movieId: Int, response: @escaping (MovieDetails?) -> ())
    var movieService: MovieServiceProtocol { get }
    var movieResults: [Result] { get }
    var movieOutput: MovieOutput? { get set }
    func setDelegate(output: MovieOutput)
}

final class MovieViewModel: MovieProtocol {
    let movieService: MovieServiceProtocol = MovieService()
//    init() {
//        movieService
//    }
    var movieResults: [Result] = []
    var movieOutput: MovieOutput?
    func setDelegate(output: MovieOutput) {
        movieOutput = output
    }
}

extension MovieViewModel {
    func fetchDatas() {
        movieService.fetchAllDatas() { [weak self] (model) in
            self?.movieResults = model ?? []
            self?.movieOutput?.saveAllDatas(values: self?.movieResults ?? [])
        }
    }

    func fetchDetails(movieId: Int, response: @escaping (MovieDetails?) -> ()) {
        movieService.fetchAllDetails(movieId: movieId) { data in
            guard let data = data else {
                response(nil)
                return
            }
            response(data)
        }
    }
}
