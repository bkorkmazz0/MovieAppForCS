//
//  MovieViewController.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 28.11.2022.
//

import UIKit
import SnapKit

protocol MovieVCProtocol: AnyObject {
    func configureDesign()
    func configureTableView()
    func reloadTableView()
    func navigateToDetailScreen(movie: MovieDetails)
}

final class MovieVC: UIViewController {
    private let viewModel = MovieViewModel()

    private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.view = self
        viewModel.viewDidLoad()
    }
}

extension MovieVC: MovieVCProtocol {
    func configureDesign() {
        view.backgroundColor = .systemBackground
        navigationItem.backButtonTitle = "Back"
        title = "Popular Movies 🔥"
    }

    func configureTableView() {
        tableView = UITableView(frame: .zero)
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.movieTableViewCell)
        tableView.separatorStyle = .none
        tableView.accessibilityIdentifier = UIAccessibleIdentifiers.MovieVC.moviesTableView

        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(10)
        }
    }

    func reloadTableView() {
        tableView.reloadOnMainThread()
    }

    func navigateToDetailScreen(movie: MovieDetails) {
        DispatchQueue.main.async {
            let detailScreen = MovieDetailVC(movie: movie)
            self.navigationController?.pushViewController(detailScreen, animated: true)
        }
    }
}

extension MovieVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.movieTableViewCell) as? MovieCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.configureSetupDatas(model: viewModel.movies[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.getDetail(movieId: viewModel.movies[indexPath.row]._id)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat.deviceWidth * 0.58
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height

        if offsetY >= contentHeight - (2 * height) {
            viewModel.getMovies()
        }
    }
}
