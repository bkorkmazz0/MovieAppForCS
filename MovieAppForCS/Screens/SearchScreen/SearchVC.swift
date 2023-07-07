//
// SearchVC.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 24.01.2023.
//

import UIKit
import SnapKit

protocol SearchVCProtocol: AnyObject {
    func configureDesign()
    func reloadTableView()
    func navigateToDetailScreen(movie: MovieDetails)
}

final class SearchVC: UIViewController {
    private let viewModel = SearchViewModel()
    private var searchText = ""

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.MovieCellConstant.movieTableViewCellIdentifier.rawValue)
        tableView.separatorStyle = .none
        #warning("//TODO right identifiers")
        tableView.accessibilityIdentifier = UIAccessibleIdentifiers.MovieVC.moviesTableView

        view.addSubview(tableView)

        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        return tableView
    }()

    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)

        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Find films..."
        searchController.searchBar.sizeToFit()
        searchController.searchBar.searchBarStyle = .prominent
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false

        searchController.searchBar.searchTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

        return searchController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        searchText = searchController.searchBar.text ?? ""
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tabBarShow(isHidden: false, animation: false, alpha: 1)
        searchController.isActive = false
        searchController.searchBar.text = searchText
    }
}

extension SearchVC: SearchVCProtocol {
    func configureDesign() {
        title = "Search"
        view.backgroundColor = .systemBackground
        navigationItem.backButtonDisplayMode = .minimal
        navigationController?.navigationBar.prefersLargeTitles = true
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

extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.searchMovies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.MovieCellConstant.movieTableViewCellIdentifier.rawValue) as? MovieCell else { return UITableViewCell() }
        cell.configureSetupDatas(model: viewModel.searchMovies[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.getDetail(movieId: viewModel.searchMovies[indexPath.row]._id)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat.deviceWidth * 0.55
    }
}

extension SearchVC: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        let searchMovieName = searchText.replacingOccurrences(of: " ", with: "%20")
        viewModel.getMovies(searchMovieName)
    }
}

extension SearchVC {
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField.text?.isEmpty == true {
            viewModel.searchMovies.removeAll()
            tableView.reloadData()
        }
    }
}
