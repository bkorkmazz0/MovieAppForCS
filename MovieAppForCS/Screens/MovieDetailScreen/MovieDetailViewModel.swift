//
//  MovieDetailViewModel.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 26.12.2022.
//

import Foundation

protocol MovieDetailViewModelProtocol {
    var view: MovieDetailVCProtocol? { get set }

    func viewDidLoad()
}

final class MovieDetailViewModel {
    weak var view: MovieDetailVCProtocol?
}

extension MovieDetailViewModel: MovieDetailViewModelProtocol {
    func viewDidLoad() {
        view?.configureDesign()
        view?.configureAddSubViews()
        view?.configureSetupUIs()
        view?.configureSetupDatas()
    }
}
