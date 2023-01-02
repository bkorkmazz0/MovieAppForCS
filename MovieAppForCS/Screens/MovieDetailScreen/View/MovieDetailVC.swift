//
//  MovieDetailViewController.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 28.11.2022.
//

import UIKit
import SnapKit
import Kingfisher

protocol MovieDetailVCProtocol: AnyObject {
    func configureDesign()
    func configureAddSubViews()
    func configureSetupUIs()
    func configureSetupDatas()
}

final class MovieDetailVC: UIViewController {

    // MARK: - Properties
    private let movie: MovieDetails
    private let viewModel = MovieDetailViewModel()
    private var isHeartFilled = false
    private var isWatchFilled = false
    private let padding: CGFloat = 15

    // MARK: - UI Elements
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .systemBackground
        scrollView.frame = CGRect(x: 0, y: 0, width: CGFloat.deviceWidth, height: CGFloat.deviceHeight)
        scrollView.contentSize = CGSize(width: CGFloat.deviceWidth, height: CGFloat.deviceHeight * 3)
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [detailImageView, detailTagLineLabel, allHorizontalView, detailOverviewLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 20
        return stackView
    }()

    private lazy var buttonView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        view.layer.shadowColor = UIColor.systemGray4.cgColor
        view.layer.shadowOpacity = 0.4
        view.accessibilityIdentifier = UIAccessibleIdentifiers.MovieDetailVC.movieDetailButtonView
        return view
    }()

    private let detailImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.accessibilityIdentifier = UIAccessibleIdentifiers.MovieDetailVC.movieDetailImageView
        return imageView
    }()

    private let detailTagLineLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.accessibilityIdentifier = UIAccessibleIdentifiers.MovieDetailVC.movieDetailTagLineLabel
        return label
    }()

    private let detailStarImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "star.fill")
        imageView.tintColor = .systemYellow
        imageView.accessibilityIdentifier = UIAccessibleIdentifiers.MovieDetailVC.movieDetailStarImageLabel
        return imageView
    }()

    private let detailAverageVoteLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 18)
        label.accessibilityIdentifier = UIAccessibleIdentifiers.MovieDetailVC.movieDetailAverageVoteLabel
        return label
    }()

    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [detailStarImageView, detailAverageVoteLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 2
        return stackView
    }()

    private let detailGenresLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.accessibilityIdentifier = UIAccessibleIdentifiers.MovieDetailVC.movieDetailGenresLabel
        return label
    }()

    private let detailReleaseDateLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 18)
        label.accessibilityIdentifier = UIAccessibleIdentifiers.MovieDetailVC.movieDetailReleaseDateLabel
        return label
    }()

    private lazy var allHorizontalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [detailGenresLabel, horizontalStackView, detailReleaseDateLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 30
        return stackView
    }()

    private lazy var allHorizontalView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray.withAlphaComponent(0.3)
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.accessibilityIdentifier = UIAccessibleIdentifiers.MovieDetailVC.movieDetailAllHorizontalView
        return view
    }()

    private let detailOverviewLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.italicSystemFont(ofSize: 18)
        label.accessibilityIdentifier = UIAccessibleIdentifiers.MovieDetailVC.movieDetailOverviewLabel
        return label
    }()

    private lazy var horizontalButtonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [officialButton, imdbButton, favButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }()

    private let officialButton = CustomButton(color: .systemGreen, title: "Official", systemImageName: "play.rectangle", identifier: UIAccessibleIdentifiers.MovieDetailVC.movieDetailOfficialButton)

    private let imdbButton = CustomButton(color: .systemBlue, title: "IMDb", systemImageName: "play.rectangle", identifier: UIAccessibleIdentifiers.MovieDetailVC.movieDetailImdbButton)

    private let favButton = CustomButton(color: .systemRed, title: "", systemImageName: "heart", identifier: UIAccessibleIdentifiers.MovieDetailVC.movieDetailFavButton)

    private let addToWatchListButton = CustomButton(color: .systemOrange, title: "", systemImageName: "plus.app", identifier: UIAccessibleIdentifiers.MovieDetailVC.movieDetailAddToWatchButton)

    private let commentButton = CustomButton(color: .systemCyan, title: "", systemImageName: "square.and.pencil", identifier: UIAccessibleIdentifiers.MovieDetailVC.movieDetailMakeCommentButton)

    private let detailPopup = CustomPopupVC(title: "Rate The Product", buttonText: "Make Comment")

    // MARK: - Life Cycle
    init(movie: MovieDetails) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
        detailPopup.delegate = self
    }
}
// MARK: - Functions
extension MovieDetailVC: MovieDetailVCProtocol {
    func configureDesign() {
        view.backgroundColor = .systemBackground
        navigationItem.title = movie._title
        navigationController?.navigationBar.accessibilityIdentifier = UIAccessibleIdentifiers.MovieDetailVC.movieDetailNavigationBar
    }

    func configureSetupUIs() {
        makeScrollView()
        makeStackView()
        makeDetailImageView()
        makeDetailTagLineLabel()
        makeAllHorizontalStackView()
        makeAllHorizontalView()
        makeDetailOverviewLabel()
        makeButtonView()
        makeHorizontalButtonStackView()
        makeOfficialButton()
        makeImdbButton()
        makeFavButton()
        makeAddToWatchListButton()
        makeCommentButton()
    }

    func configureAddSubViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        scrollView.addSubview(addToWatchListButton)
        scrollView.addSubview(commentButton)
        allHorizontalView.addSubview(allHorizontalStackView)

        view.addSubview(buttonView)
        buttonView.addSubview(horizontalButtonStackView)
        horizontalButtonStackView.addArrangedSubview(officialButton)
        horizontalButtonStackView.addArrangedSubview(imdbButton)
        horizontalButtonStackView.addArrangedSubview(favButton)
    }

    func configureSetupDatas() {
        detailImageView.kf.setImage(with: URL(string: ServiceEndpoints.imageURL(posterPath: movie._posterPath)))
        detailTagLineLabel.text = movie._tagline.trimmingCharacters(in: .whitespaces)
        detailOverviewLabel.text = movie._overview.trimmingCharacters(in: .whitespaces)
        detailAverageVoteLabel.text = String(format: "%.1f", movie.voteAverage ?? 0.0)
        detailGenresLabel.text = movie.genres?.first?._name
        detailReleaseDateLabel.text = String((movie._releaseDate.split(separator: "-").first) ?? "")
    }
}

extension MovieDetailVC: PopupWindowDelegate {
    func didTapPopupButton() {
        showToast(message: "Thanks for your comment.", seconds: 1.5, color: .systemGreen, style: .alert)
    }

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
            make.height.equalTo(CGFloat.deviceHeight / 2.2)
            make.width.equalTo(CGFloat.deviceWidth / 1.6)
            make.top.equalToSuperview().offset(padding)
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
            make.leading.trailing.equalToSuperview().inset(padding)
        }
    }

    func makeAllHorizontalView() {
        allHorizontalView.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview().inset(padding * 2)
        }
    }

    func makeDetailOverviewLabel() {
        detailOverviewLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(40)
            make.bottom.equalTo(scrollView.snp.bottom).offset(-50)
        }
    }

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
            make.leading.trailing.equalToSuperview().inset(padding)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }

    func makeOfficialButton() {
        officialButton.addTarget(self, action: #selector(directToMovieUrl), for: .touchUpInside)

        officialButton.snp.makeConstraints { make in
            make.width.equalTo((CGFloat.deviceWidth - 40) / 3)
            make.height.equalTo(50)
        }
    }

    func makeImdbButton() {
        imdbButton.addTarget(self, action: #selector(directToImdbUrl), for: .touchUpInside)

        imdbButton.snp.makeConstraints { make in
            make.width.equalTo(((CGFloat.deviceWidth - 40) / 3))
            make.height.equalTo(50)
        }
    }

    func makeFavButton() {
        favButton.addTarget(self, action: #selector(favButtonTapped), for: .touchUpInside)

        favButton.snp.makeConstraints { make in
            make.width.equalTo(((CGFloat.deviceWidth - 40) / 3))
            make.height.equalTo(50)
        }
    }

    func makeAddToWatchListButton() {
        addToWatchListButton.addTarget(self, action: #selector(addToWatchListButtonClicked), for: .touchUpInside)

        addToWatchListButton.snp.makeConstraints { make in
            make.top.equalTo(detailImageView.snp.top)
            make.leading.equalTo(detailImageView.snp.trailing).offset(padding)
            make.trailing.equalToSuperview().offset(-padding)
            make.width.height.equalTo(50)
        }
    }

    func makeCommentButton() {
        commentButton.addTarget(self, action: #selector(commentButtonClicked), for: .touchUpInside)

        commentButton.snp.makeConstraints { make in
            make.top.equalTo(addToWatchListButton.snp.bottom).offset(padding)
            make.leading.equalTo(detailImageView.snp.trailing).offset(padding)
            make.trailing.equalToSuperview().offset(-padding)
            make.width.height.equalTo(50)
        }
    }

    @objc func directToMovieUrl() {
        guard let url = URL(string: movie._homepage) else { return }
        UIApplication.shared.open(url)
    }

    @objc func directToImdbUrl() {
        guard let url = URL(string: ServiceEndpoints.IMDB_URL.rawValue + (movie._imdbID)) else { return }
        UIApplication.shared.open(url)
    }

    @objc func favButtonTapped() {
        isHeartFilled.toggle()
        if isHeartFilled {
            showToast(message: "Added to favorites", seconds: 1.5, color: .systemRed, style: .alert)
            favButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)

        } else {
            showToast(message: "Removed from favorites", seconds: 1.5, color: .systemRed, style: .alert)
            favButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }

    @objc func addToWatchListButtonClicked() {
        isWatchFilled.toggle()

        if isWatchFilled {
            showToast(message: "Added to watchlist", seconds: 1.5, color: .systemOrange, style: .alert)
            addToWatchListButton.setImage(UIImage(systemName: "plus.app.fill"), for: .normal)
        } else {
            showToast(message: "Removed from watchlist", seconds: 1.5, color: .systemOrange, style: .alert)
            addToWatchListButton.setImage(UIImage(systemName: "plus.app"), for: .normal)
        }
    }

    @objc func commentButtonClicked() {
        self.present(detailPopup, animated: true, completion: { [self] in
            detailPopup.view.superview?.isUserInteractionEnabled = true
            detailPopup.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissOnTapOutside)))
        })
    }

    @objc func dismissOnTapOutside() {
        self.dismiss(animated: true, completion: nil)
    }
}
