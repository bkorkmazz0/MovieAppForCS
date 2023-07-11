//
//  UIAccessibleIdentifiers.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 11.12.2022.
//

import Foundation

struct UIAccessibleIdentifiers {

    // MARK: - TabBar
    struct TabBar {
        static let tabBar = "tabBar"
    }
    
    // MARK: - AccountVC
    struct AccountVC {
        static let accountNavigationBarTitle = "Account"
        static let accountImageView = "account-image-view"
        static let accountTableView = "account-table-view"
    }
    
    // MARK: - AccountCell
    struct AccountCell {
        static let accountCellTitleLabel = "account-cell-title-label"
    }
    
    // MARK: - SignHeaderView
    struct SignHeaderView {
        static let signHeaderViewImageView = "signHeaderView-image-view"
        static let signHeaderViewLabel = "signHeaderView-label"
    }
    
    // MARK: - SignInVC
    struct SignInVC {
        static let signInEmailField = "signIn-email-field"
        static let signInPasswordField = "signIn-password-field"
        static let signInSignInButton = "signIn-signIn-button"
        static let signInCreateAccountButton = "signIn-create-account-button"
    }
    
    // MARK: - SignUpVC
    struct SignUpVC {
        static let signUpFullNameField = "signUp-full-name-field"
        static let signUpEmailField = "signUp-email-field"
        static let signUpPasswordField = "signUp-password-field"
        static let signUpSignUpButton = "signUp-signUp-button"
    }
    
    // MARK: - MovieVC
    struct MovieVC {
        static let moviesTableView = "movies-table-view"
        static let moviesNavigationBarTitle = "Popular"
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
        static let addedToWatchlistAlert = "Added to watchlist"
        static let remowedFromWatchlistAlert = "Removed from watchlist"
        static let addedToFavoritesAlert = "Added to favorites"
        static let remowedFromFavoritesAlert = "Removed from favorites"
        static let popupBlankMessageAlert = "TextView cannot be left blank!"
        static let popupThanksMessageAlert = "Thanks for your comment."
    }
}
