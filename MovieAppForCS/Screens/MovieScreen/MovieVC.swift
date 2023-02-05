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
    func reloadTableView()
    func navigateToDetailScreen(movie: MovieDetails)
}

final class MovieVC: UIViewController {
    private let viewModel = MovieViewModel()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.MovieCellConstant.movieTableViewCellIdentifier.rawValue)
        tableView.separatorStyle = .none
        tableView.accessibilityIdentifier = UIAccessibleIdentifiers.MovieVC.moviesTableView

        view.addSubview(tableView)

        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.view = self
        viewModel.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        tabBarShow(isHidden: false, animation: false, alpha: 1)
    }
}

extension MovieVC: MovieVCProtocol {
    func configureDesign() {
        view.backgroundColor = .systemBackground
        navigationItem.backButtonDisplayMode = .minimal
        configureNavigationBar(largeTitleColor: .black, backgoundColor: .white, title: "Popular", preferredLargeTitle: true)
    }

    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.MovieCellConstant.movieTableViewCellIdentifier.rawValue) as? MovieCell else { return UITableViewCell() }
        cell.configureSetupDatas(model: viewModel.movies[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.getDetail(movieId: viewModel.movies[indexPath.row]._id)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat.deviceWidth * 0.55
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
