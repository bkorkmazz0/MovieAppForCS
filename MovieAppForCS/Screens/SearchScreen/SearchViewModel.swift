//
//  SearchViewModel.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 29.01.2023.
//

import Foundation

protocol SearchViewModelProtocol {
    var view: SearchVCProtocol? { get set }

    func viewDidLoad()
    func getMovies(_ searchMovieName: String)
    func getDetail(movieId: Int)
}

final class SearchViewModel {
    weak var view: SearchVCProtocol?
    private let searchService = SearchService()
    private let movieDetailService = MovieDetailService()
    var searchMovies: [Search] = []
    private var searchMovieName: String = ""
}

extension SearchViewModel: SearchViewModelProtocol {
    func viewDidLoad() {
        view?.configureDesign()
        getMovies(searchMovieName)
    }

    func getMovies(_ searchMovieName: String) {
        searchService.searchMovies(searchMovieName: searchMovieName) { [weak self] returnedSearchMovies in
            guard let self = self else { return }
            guard let returnedSearchMovies = returnedSearchMovies else { return }

            self.searchMovies = returnedSearchMovies
            self.view?.reloadTableView()
        }
    }

    func getDetail(movieId: Int) {
        movieDetailService.fetchAllMovieDetails(movieId: movieId) { [weak self] returnedDetail in
            guard let self = self else { return }
            guard let returnedDetail = returnedDetail else { return }

            self.view?.navigateToDetailScreen(movie: returnedDetail)
        }
    }
}
