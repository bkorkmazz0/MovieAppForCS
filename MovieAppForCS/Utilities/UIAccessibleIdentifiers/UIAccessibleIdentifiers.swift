//
//  UITestIdentifier.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 11.12.2022.
//

import Foundation

struct UIAccessibleIdentifiers {

    // MARK: - MovieVC
    struct MovieVC {
        static let moviesTableView = "movies-table-view"
        static let moviesNavigationBarTitle = "Popular Movies 🔥"
    }

    // MARK: - MovieCell
    struct MovieCell {
        static let movieCellImageView = "movie-cell-image-view"
        static let movieCellTitleLabel = "movie-cell-title-label"
        static let movieCellStarImageView = "movie-cell-star-image-view"
        static let movieCellAverageVoteLabel = "movie-cell-average-vote-label"
        static let movieCellReleaseDateLabel = "movie-cell-release-date-label"
    }

    // MARK: - MovieDetailVC
    struct MovieDetailVC {
        static let movieDetailImageView = "movie-detail-image-view"
        static let movieDetailTagLineLabel = "movie-detail-tag-line-label"
        static let movieDetailStarImageLabel = "movie-detail-star-image-label"
        static let movieDetailAverageVoteLabel = "movie-detail-average-vote-label"
        static let movieDetailGenresLabel = "movie-detail-genres-label"
        static let movieDetailReleaseDateLabel = "movie-detail-release-date-label"
        static let movieDetailOverviewLabel = "movie-detail-overview-label"
        static let movieDetailAddToWatchButton = "movie-detail-add-to-watch-button"
        static let movieDetailMakeCommentButton = "movie-detail-make-comment-button"
        static let movieDetailOfficialButton = "movie-detail-official-button"
        static let movieDetailImdbButton = "movie-detail-imdb-button"
        static let movieDetailFavButton = "movie-detail-fav-button"
        static let movieDetailNavigationBar = "movie-detail-navigation-bar"
        static let movieDetailAllHorizontalView = "movie-detail-all-horzontal-view"
        static let movieDetailButtonView = "movie-detail-button-view"
    }

    // MARK: - CustomPopupVC
    struct CustomPopupVC {
        static let popupWindowPopupView = "popup-window-popup-view"
        static let popupWindowPopupLabel = "popup-window-popup-label"
        static let popupWindowPopupTextView = "popup-window-popup-text-view"
        static let popupWindowPopupButton = "popup-window-popup-button"
    }

    // MARK: - CustomToastMessage
    struct CustomToastMessage {
//            static let productCellCurrentPriceFirstPartLabel = "product-cell-current-price-first-part-label"
//            static let productCellCurrentOldFirstPartLabel = "product-cell-current-old-first-part-label"
//            static let productCellRatingAlternateLabel = "product-cell-rating-alternate-label"
//            static let collectionView = "productlist-collection-view"
//            static let itemFav = "product-item-fav"
    }
}
