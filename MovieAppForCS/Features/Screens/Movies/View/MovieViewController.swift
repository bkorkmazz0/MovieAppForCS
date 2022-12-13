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

final class MovieViewController: UIViewController {

// MARK: - Properties
    private lazy var results: [Result] = []
    lazy var viewModel: MovieProtocol = MovieViewModel()

// MARK: - UI Elements
    private lazy var tableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.Identifier.movieTableViewCell.rawValue)
        tableView.rowHeight = 180
        tableView.separatorStyle = .none
        tableView.accessibilityIdentifier = Constant.UITestIdentifier.MovieViewController.moviesTableView
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
        title = "Movies"
    }

    private func addSubviews() {
        view.addSubview(tableView)
    }
}

// MARK: - Tableview Extension
extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: MovieTableViewCell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.Identifier.movieTableViewCell.rawValue) as? MovieTableViewCell else { return UITableViewCell() }
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
extension MovieViewController {
    private func makeTableView() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(10)
        }
    }
}

extension MovieViewController: MovieOutput {
    func saveAllDatas(values: [Result]) {
        results = values
        tableView.reloadData()
    }

    func selectedMovie(movieId: Int) {
        viewModel.fetchDetails(movieId: movieId) { data in
            guard let data = data else { return }
            self.navigationController?.pushViewController(MovieDetailViewController(movieDetails: data), animated: true)
        }
    }
}
