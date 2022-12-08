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
    private let movieDetails: MovieDetails
    private var isHeartFilled = false
    private var isWatchFilled = false

// MARK: - UI Elements
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemBackground
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
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

    private lazy var buttonView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.shadowColor = UIColor.systemGray4.cgColor
        view.layer.shadowOpacity = 0.4
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

    private lazy var allHorizontalView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4.withAlphaComponent(0.5)
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let detailOverviewLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.italicSystemFont(ofSize: 20)
        return label
    }()

    private let movieButton = CustomButton(color: .systemGreen, title: "Official", systemImageName: "play.rectangle")

    private let imdbButton = CustomButton(color: .systemBlue, title: "IMDb", systemImageName: "play.rectangle")

    private let favButton = CustomButton(color: .systemRed, title: "", systemImageName: "heart")

    private lazy var horizontalButtonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [movieButton, imdbButton, favButton])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }()

    private let addToWatchListButton = CustomButton(color: .orange, title: "", systemImageName: "plus.app")

    private let commentButton = CustomButton(color: .systemCyan, title: "", systemImageName: "square.and.pencil")

    private let detailPopup = PopupWindowViewController(title: "Rate The Product", buttonText: "Make Comment")

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
        makeAddToWatchListButton()
        makeCommentButton()
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
        scrollView.addSubview(addToWatchListButton)
        scrollView.addSubview(commentButton)
        allHorizontalView.addSubview(allHorizontalStackView)

        view.addSubview(buttonView)
        buttonView.addSubview(horizontalButtonStackView)
        horizontalButtonStackView.addArrangedSubview(movieButton)
        horizontalButtonStackView.addArrangedSubview(imdbButton)
        horizontalButtonStackView.addArrangedSubview(favButton)
    }

    func drawDesign() {
        view.backgroundColor = .systemBackground
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

    func makeAddToWatchListButton() {
        addToWatchListButton.addTarget(self, action: #selector(addToWatchListButtonClicked), for: .touchUpInside)

        addToWatchListButton.snp.makeConstraints { make in
            make.top.equalTo(detailImageView.snp.top)
            make.leading.equalTo(detailImageView.snp.trailing).offset(15)
            make.width.height.equalTo(50)
        }
    }

    @objc func addToWatchListButtonClicked() {
        isWatchFilled.toggle()

        if isWatchFilled {
            let toast = UIAlertController(title: "-----------", message: "Added to watchlist", preferredStyle: .alert)
            present(toast, animated: true, completion: nil)
            addToWatchListButton.setImage(UIImage(systemName: "plus.app.fill"), for: .normal)

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                toast.dismiss(animated: true, completion: nil)
            }

        } else {
            let toast = UIAlertController(title: "-----------", message: "Removed from watchlist", preferredStyle: .alert)
            present(toast, animated: true, completion: nil)
            addToWatchListButton.setImage(UIImage(systemName: "plus.app"), for: .normal)

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                toast.dismiss(animated: true, completion: nil)
            }
        }
    }

    func makeCommentButton() {
        commentButton.addTarget(self, action: #selector(commentButtonClicked), for: .touchUpInside)

        commentButton.snp.makeConstraints { make in
            make.top.equalTo(addToWatchListButton.snp.bottom).offset(15)
            make.leading.equalTo(detailImageView.snp.trailing).offset(15)
            make.width.height.equalTo(50)
        }
    }

    @objc func commentButtonClicked() {
        self.present(detailPopup, animated: true, completion: { [self] in
            detailPopup.view.superview?.isUserInteractionEnabled = true
            detailPopup.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissOnTapOutside)))
        })
    }

    @objc func dismissOnTapOutside(){
       self.dismiss(animated: true, completion: nil)
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
            make.bottom.equalTo(scrollView.snp.bottom).offset(-50)
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
        favButton.addTarget(self, action: #selector(favButtonTapped), for: .touchUpInside)

        favButton.snp.makeConstraints { make in
            make.width.equalTo(((view.frame.size.width - 40) / 3))
            make.height.equalTo(50)
        }
    }

    @objc func favButtonTapped() {
        isHeartFilled.toggle()
        if isHeartFilled {
            let toast = UIAlertController(title: "-----------", message: "Added to favorites", preferredStyle: .actionSheet)
            present(toast, animated: true, completion: nil)
            favButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                toast.dismiss(animated: true, completion: nil)
            }

        } else {
            let toast = UIAlertController(title: "-----------", message: "Removed from favorites", preferredStyle: .actionSheet)
            present(toast, animated: true, completion: nil)
            favButton.setImage(UIImage(systemName: "heart"), for: .normal)

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                toast.dismiss(animated: true, completion: nil)
            }
        }
    }
}


