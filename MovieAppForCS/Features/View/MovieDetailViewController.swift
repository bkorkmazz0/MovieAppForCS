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
        let stackView = UIStackView(arrangedSubviews: [detailImageView, detailTagLineLabel, allHorizontalStackView, detailOverviewLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
        label.font = UIFont.boldSystemFont(ofSize: 20)
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
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 1
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
        stackView.spacing = 10
        stackView.backgroundColor = .systemGray4.withAlphaComponent(0.3)
        stackView.layer.cornerRadius = 10
        stackView.layer.borderWidth = 0.2
        stackView.clipsToBounds = true
        return stackView
    }()

    private let detailOverviewLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()

    private let imdbButton = CustomButton(color: .systemYellow, title: "Go to IMDb page", systemImageName: "arrow.up.right")

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
        makeAllHorizontalStackView()
        makeDetailOverviewLabel()

        makeButtonView()
        makeImdbButton()
    }

    func addUIElements() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)

        view.addSubview(buttonView)
        buttonView.addSubview(imdbButton)
    }

    func drawDesign() {
        view.backgroundColor = .systemBackground
        navigationItem.backBarButtonItem?.tintColor = UIColor(named: "black")
        navigationItem.title = movieDetails.title
    }

    func setUpDatas() {
        detailImageView.kf.setImage(with: URL(string: Constant.ServiceEndPoints.BASE_IMAGE_URL.rawValue + (movieDetails.posterPath ?? "")))
        detailAverageVoteLabel.text = String(format: "%.1f", movieDetails.voteAverage ?? 00)
        detailReleaseDateLabel.text = String((movieDetails.releaseDate?.split(separator: "-").first) ?? "")
        detailGenresLabel.text = movieDetails.genres?.first?.name
        detailOverviewLabel.text = movieDetails.overview?.trimmingCharacters(in: .whitespaces)
        detailTagLineLabel.text = movieDetails.tagline?.trimmingCharacters(in: .whitespaces)
    }
}

// MARK: - SnapKit
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

    func makeButtonView() {
        buttonView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(100)
        }
    }

    func makeDetailImageView() {
        detailImageView.snp.makeConstraints { make in
            make.height.equalTo(350)
            make.width.equalTo(250)
            make.top.equalToSuperview().offset(15)
        }
    }

    func makeAllHorizontalStackView() {
        allHorizontalStackView.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.leading.trailing.equalToSuperview().inset(50)
        }
    }

    func makeDetailOverviewLabel() {
        detailOverviewLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(50)
            make.bottom.equalTo(scrollView.snp.bottom).offset(-15)
        }
    }

    func makeImdbButton() {
        imdbButton.addTarget(self, action: #selector(directToUrl), for: .touchUpInside)

        imdbButton.snp.makeConstraints { make in
            make.width.equalTo(250)
            make.height.equalTo(50)
            make.centerX.equalTo(buttonView.snp.centerX)
            make.centerY.equalTo(buttonView.snp.centerY).offset(-8)
        }
    }

    @objc func directToUrl() {
        guard let url = URL(string: Constant.ServiceEndPoints.IMDB_URL.rawValue + (movieDetails.imdbID ?? "")) else { return }
        UIApplication.shared.open(url)
    }
}
