//
//  MovieDetailViewController.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 28.11.2022.
//

import UIKit
import SnapKit

class MovieDetailViewController: UIViewController {
    private let service = MovieService()
    private var movieDetails: MovieDetails

// MARK: - UI Elements
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemBackground
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height * 3)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [detailImageView, detailTagLineLabel, allHorizontalView, detailOverviewLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var allHorizontalView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4.withAlphaComponent(0.5)
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var buttonView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.shadowColor = UIColor.systemGray4.cgColor
        view.layer.shadowOpacity = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let detailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()

    private let detailTagLineLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()

    private let detailStarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.fill")
        imageView.tintColor = .systemYellow
        return imageView
    }()

    private let detailAverageVoteLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()

    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [detailStarImageView, detailAverageVoteLabel])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 2
        return stackView
    }()

    private let detailGenresLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()

    private let detailReleaseDateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()

    private lazy var allHorizontalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [detailGenresLabel, horizontalStackView, detailReleaseDateLabel])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 30
        return stackView
    }()

    private let detailOverviewLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.italicSystemFont(ofSize: 20)
        return label
    }()

    private let imdbButton = CustomButton(color: .systemYellow, title: "IMDb", systemImageName: "play.rectangle")

    private let movieButton = CustomButton(color: .systemGreen, title: "Movie", systemImageName: "play.rectangle")

    private let favButton = CustomButton(color: .systemRed, title: "", systemImageName: "heart.fill")

    private lazy var horizontalButtonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [movieButton, imdbButton, favButton])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }()

// MARK: - Life Cycle
    init(movieDetails: MovieDetails) {
        self.movieDetails = movieDetails
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

// MARK: - Functions
    func configure() {
        addUIElements()
        drawDesign()
        setUpDatas()

        makeScrollView()
        makeStackView()

        makeDetailImageView()
        makeDetailTagLineLabel()
        makeAllHorizontalView()
        makeAllHorizontalStackView()
        makeDetailOverviewLabel()

        makeButtonView()
        makeHorizontalButtonStackView()
        makeMovieButton()
        makeImdbButton()
        makeFavButton()
    }

    func addUIElements() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        allHorizontalView.addSubview(allHorizontalStackView)

        view.addSubview(buttonView)
        buttonView.addSubview(horizontalButtonStackView)
        horizontalButtonStackView.addArrangedSubview(movieButton)
        horizontalButtonStackView.addArrangedSubview(imdbButton)
        horizontalButtonStackView.addArrangedSubview(favButton)

    }

    func drawDesign() {
        view.backgroundColor = .systemBackground
        navigationItem.backBarButtonItem?.tintColor = UIColor(named: "black")
        navigationItem.title = movieDetails.title
    }

    func setUpDatas() {
        detailImageView.kf.setImage(with: URL(string: Constant.ServiceEndPoints.BASE_IMAGE_URL.rawValue + (movieDetails.posterPath ?? "")))
        detailAverageVoteLabel.text = String(format: "%.1f", movieDetails.voteAverage ?? 0.0)
        detailReleaseDateLabel.text = String((movieDetails.releaseDate?.split(separator: "-").first) ?? "")
        detailGenresLabel.text = movieDetails.genres?.first?.name
        detailOverviewLabel.text = movieDetails.overview?.trimmingCharacters(in: .whitespaces)
        detailTagLineLabel.text = movieDetails.tagline?.trimmingCharacters(in: .whitespaces)
    }
}

// MARK: - SnapKit - ScrolView
extension MovieDetailViewController {

    func makeScrollView() {
        scrollView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-100)
        }
    }

    func makeStackView() {
        stackView.snp.makeConstraints { make in
            make.top.equalTo(scrollView)
            make.left.right.equalTo(scrollView)
            make.width.equalTo(scrollView)
        }
    }

    func makeDetailImageView() {
        detailImageView.snp.makeConstraints { make in
            make.height.equalTo(350)
            make.width.equalTo(250)
            make.top.equalToSuperview().offset(15)
        }
    }

    func makeDetailTagLineLabel() {
        detailTagLineLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(40)
        }
    }

    func makeAllHorizontalStackView() {
        allHorizontalStackView.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview().inset(15)
        }
    }

    func makeAllHorizontalView() {
        allHorizontalView.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview().inset(30)
        }
    }

    func makeDetailOverviewLabel() {
        detailOverviewLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(50)
            make.bottom.equalTo(scrollView.snp.bottom).offset(-15)
        }
    }
}

// MARK: - SnapKit - ButtonView
extension MovieDetailViewController {

    func makeButtonView() {
        buttonView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(100)
        }
    }

    func makeHorizontalButtonStackView() {
        horizontalButtonStackView.snp.makeConstraints { make in
            make.top.equalTo(buttonView.snp.top)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }

    func makeMovieButton() {
        movieButton.addTarget(self, action: #selector(directToMovieUrl), for: .touchUpInside)

        movieButton.snp.makeConstraints { make in
            make.width.equalTo((view.frame.size.width - 40) / 3)
            make.height.equalTo(50)
        }
    }

    @objc func directToMovieUrl() {
        guard let url = URL(string: movieDetails.homepage ?? "") else { return }
        UIApplication.shared.open(url)
    }

    func makeImdbButton() {
        imdbButton.addTarget(self, action: #selector(directToImdbUrl), for: .touchUpInside)

        imdbButton.snp.makeConstraints { make in
            make.width.equalTo(((view.frame.size.width - 40) / 3))
            make.height.equalTo(50)
        }
    }

    @objc func directToImdbUrl() {
        guard let url = URL(string: Constant.ServiceEndPoints.IMDB_URL.rawValue + (movieDetails.imdbID ?? "")) else { return }
        UIApplication.shared.open(url)
    }
    
    func makeFavButton() {
        favButton.snp.makeConstraints { make in
            make.width.equalTo(((view.frame.size.width - 40) / 3))
            make.height.equalTo(50)
        }
    }
}


