//
//  MovieViewModel.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 28.11.2022.
//

import Foundation

protocol MovieViewModelProtocol {
    var view: MovieVCProtocol? { get set }

    func viewDidLoad()
    func getMovies()
    func getDetail(movieId: Int)
}

final class MovieViewModel {
    weak var view: MovieVCProtocol?
    private let service = MovieService()
    var movies: [Result] = []
    private var page: Int = 1
}

extension MovieViewModel: MovieViewModelProtocol {
    func viewDidLoad() {
        view?.configureDesign()
        view?.configureTableView()
        getMovies()
    }

    func getMovies() {
        service.fetchAllMovies(page: page) { [weak self] returnedMovies in
            guard let self = self else { return }
            guard let returnedMovies = returnedMovies else { return }

            self.movies.append(contentsOf: returnedMovies)
            self.page += 1
            self.view?.reloadTableView()
        }
    }

    func getDetail(movieId: Int) {
        service.fetchAllMovieDetails(movieId: movieId) { [weak self] returnedDetail in
            guard let self = self else { return }
            guard let returnedDetail = returnedDetail else { return }
            
            self.view?.navigateToDetailScreen(movie: returnedDetail)
        }
    }
}
