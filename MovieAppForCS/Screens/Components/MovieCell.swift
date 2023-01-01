//
//  MovieTableViewCell.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 28.11.2022.
//

import UIKit
import SnapKit
import Kingfisher

final class MovieCell: UITableViewCell {

    // MARK: - Properties
    static let movieTableViewCell = "tableViewCellIdentifier"
    private let padding: CGFloat = 15

    // MARK: - UI Elements
    private lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.backgroundColor = .lightGray.withAlphaComponent(0.3)
        view.layer.borderColor = UIColor.systemBackground.cgColor
        view.clipsToBounds = true
        return view
    }()

    private let cellImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.systemGray5.cgColor
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.accessibilityIdentifier = UIAccessibleIdentifiers.MovieCell.movieCellImageView
        return imageView
    }()

    private let cellTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 24)
        label.accessibilityIdentifier = UIAccessibleIdentifiers.MovieCell.movieCellTitleLabel
        return label
    }()

    private let cellStarImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "star.fill")
        imageView.tintColor = .systemYellow
        imageView.accessibilityIdentifier = UIAccessibleIdentifiers.MovieCell.movieCellStarImageView
        return imageView
    }()

    private let cellAverageVoteLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.accessibilityIdentifier = UIAccessibleIdentifiers.MovieCell.movieCellAverageVoteLabel
        return label
    }()

    private let cellReleaseDateLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.backgroundColor = .systemGray4.withAlphaComponent(0.4)
        label.layer.cornerRadius = 8
        label.layer.borderWidth = 0.4
        label.textAlignment = .center
        label.clipsToBounds = true
        label.accessibilityIdentifier = UIAccessibleIdentifiers.MovieCell.movieCellReleaseDateLabel
        return label
    }()

    private let cellToDetailButton: CustomButton = CustomButton(color: .systemBlue, title: "", systemImageName: "arrow.right", identifier: UIAccessibleIdentifiers.MovieCell.movieCellDirectButton)

    // MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureAddSubViews()
        configureSetupUIs()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Functions

    func configureAddSubViews() {
        addSubview(containerView)
        containerView.addSubview(cellToDetailButton)
        containerView.addSubview(cellImageView)
        containerView.addSubview(cellTitleLabel)
        containerView.addSubview(cellStarImageView)
        containerView.addSubview(cellAverageVoteLabel)
        containerView.addSubview(cellReleaseDateLabel)
    }

    func configureSetupUIs() {
        makeContainerView()
        makeImageView()
        makeTitleLabel()
        makeStarImageView()
        makeAverageVoteLabel()
        makeReleaseDateLabel()
        makeCellToDetailButton()
    }

    func configureSetupDatas(model: Result) {
        cellImageView.kf.setImage(with: URL(string: ServiceEndpoints.imageURL(posterPath: model._posterPath)))
        cellTitleLabel.text = model._title
        cellAverageVoteLabel.text = String(describing: model.voteAverage ?? 0.0)
        cellReleaseDateLabel.text = String((model._releaseDate.split(separator: "-").first) ?? "")
    }
}

// MARK: - SnapKit
extension MovieCell {

    func makeContainerView() {
        containerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(5)
        }
    }

    func makeImageView() {
        cellImageView.snp.makeConstraints { make in
            make.width.equalTo(CGFloat.deviceWidth * 0.35)
            make.top.bottom.equalTo(contentView).inset(padding)
            make.leading.equalTo(padding-5)
        }
    }

    func makeTitleLabel() {
        cellTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(cellImageView.snp.trailing).offset(padding)
            make.top.equalToSuperview().offset(padding)
            make.trailing.equalToSuperview().offset(-padding)
        }
    }

    func makeStarImageView() {
        cellStarImageView.snp.makeConstraints { make in
            make.width.equalTo(25)
            make.height.equalTo(23)
            make.leading.equalTo(cellImageView.snp.trailing).offset(padding)
            make.top.equalTo(cellTitleLabel.snp.bottom).offset(padding)

        }
    }

    func makeAverageVoteLabel() {
        cellAverageVoteLabel.snp.makeConstraints { make in
            make.leading.equalTo(cellStarImageView.snp.trailing).offset(2)
            make.top.equalTo(cellTitleLabel.snp.bottom).offset(padding)
        }
    }

    func makeReleaseDateLabel() {
        cellReleaseDateLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(24)
            make.leading.equalTo(cellAverageVoteLabel.snp.trailing).offset(padding * 2)
            make.top.equalTo(cellTitleLabel.snp.bottom).offset(padding)
        }
    }

    func makeCellToDetailButton() {
        cellToDetailButton.snp.makeConstraints { make in
            make.height.width.equalTo(35)
            make.trailing.equalToSuperview().offset(-padding)
            make.centerY.equalTo(contentView.snp.centerY)
        }
    }
}
