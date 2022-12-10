//
//  MovieViewModel.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 28.11.2022.
//

import Foundation

protocol MovieProtocol {
    func fetchDatas()
    func fetchDetails(movieId: Int, response: @escaping (MovieDetails?) -> Void)
    func setDelegate(output: MovieOutput)
    var movieOutput: MovieOutput? { get set }
    var movieService: MovieServiceProtocol { get }
    var movieResults: [Result] { get set }
}

final class MovieViewModel: MovieProtocol {
    func setDelegate(output: MovieOutput) {
        movieOutput = output
    }
    var movieOutput: MovieOutput?
    let movieService: MovieServiceProtocol
    init() {
        movieService = MovieService()
    }
    var movieResults: [Result] = []
}

extension MovieViewModel {
    func fetchDatas() {
        movieService.fetchAllDatas() { [weak self] (model) in
            self?.movieResults = model ?? []
            self?.movieOutput?.saveAllDatas(values: self?.movieResults ?? [])
        }
    }

    func fetchDetails(movieId: Int, response: @escaping (MovieDetails?) -> Void) {
        movieService.fetchAllDetails(movieId: movieId) { data in
            guard let data = data else {
                response(nil)
                return
            }
            response(data)
        }
    }
}
