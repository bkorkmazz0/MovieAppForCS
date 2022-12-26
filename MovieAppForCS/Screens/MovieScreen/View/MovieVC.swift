//
//  MovieViewController.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 28.11.2022.
//

import UIKit
import SnapKit

protocol MovieOutput {
    func saveAllDatas(values: [Result])
    func selectedMovie(movieId: Int)
}

final class MovieVC: UIViewController {

// MARK: - Properties
    private lazy var results: [Result] = []
    lazy var viewModel: MovieProtocol = MovieViewModel()

// MARK: - UI Elements
    private lazy var tableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.Identifier.movieTableViewCell.rawValue)
        tableView.rowHeight = 230
        tableView.separatorStyle = .none
        tableView.accessibilityIdentifier = UIAccessibleIdentifiers.MovieVC.moviesTableView
        return tableView
    }()

// MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        viewModel.setDelegate(output: self)
        viewModel.fetchDatas()
    }

// MARK: - Functions
    private func configure() {
        addSubviews()
        drawDesign()
        makeTableView()
    }

    private func drawDesign() {
        view.backgroundColor = .systemBackground
        title = "Popular Movies 🔥"
    }

    private func addSubviews() {
        view.addSubview(tableView)
    }
}

// MARK: - Tableview Extension
extension MovieVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: MovieCell = tableView.dequeueReusableCell(withIdentifier: MovieCell.Identifier.movieTableViewCell.rawValue) as? MovieCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.saveModel(model: results[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: indexPath, animated: true)
        viewModel.movieOutput?.selectedMovie(movieId: results[indexPath.row].id ?? 0)
    }
}

// MARK: - SnapKit Extension
extension MovieVC {
    private func makeTableView() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(10)
        }
    }
}

extension MovieVC: MovieOutput {
    func saveAllDatas(values: [Result]) {
        results = values
        tableView.reloadData()
    }

    func selectedMovie(movieId: Int) {
        viewModel.fetchDetails(movieId: movieId) { data in
            guard let data = data else { return }
            self.navigationController?.pushViewController(MovieDetailVC(movieDetails: data), animated: true)
        }
    }
}
