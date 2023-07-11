//
//  UITestLocators.swift
//  MovieAppForCSUITests
//
//  Created by Berkan Korkmaz on 29.12.2022.
//

import XCTest

struct UITestLocators {
    
    // MARK: - TabBarLocators
    struct TabBarLocators {
        static let tabBarLocator = XCUIApplication().tabBars[UIAccessibleIdentifiers.TabBar.tabBar]
    }

    // MARK: - AccountVCLocators
    struct AccountVCLocators {
        static let accountNavigationBarTitleLocator = XCUIApplication().navigationBars.staticTexts[UIAccessibleIdentifiers.AccountVC.accountNavigationBarTitle]
        static let accountImageViewLocator = XCUIApplication().images[UIAccessibleIdentifiers.AccountVC.accountImageView]
        static let accountTableViewLocator = XCUIApplication().tables[UIAccessibleIdentifiers.AccountVC.accountTableView]
        static let accountTableViewCellLocator = XCUIApplication().tables[UIAccessibleIdentifiers.AccountVC.accountTableView].cells
    }
    
    // MARK: - AccountCellLocators
    struct AccountCellLocators {
        static let accountCellTitleLabelLocator = "account-cell-title-label"
    }
    
    // MARK: - SignHeaderViewLocators
    struct SignHeaderViewLocators {
        static let signHeaderViewImageViewLocator = "signHeaderView-image-view"
        static let signHeaderViewLabelLocator = "signHeaderView-label"
    }
    
    // MARK: - SignInVCLocators
    struct SignInVCLocators {
        static let signInEmailFieldLocator = "signIn-email-field"
        static let signInPasswordFieldLocator = "signIn-password-field"
        static let signInSignInButtonLocator = "signIn-signIn-button"
        static let signInCreateAccountButtonLocator = "signIn-create-account-button"
    }
    
    // MARK: - SignUpVCLocators
    struct SignUpVCLocators {
        static let signUpFullNameFieldLocator = "signUp-full-name-field"
        static let signUpEmailFieldLocator = "signUp-email-field"
        static let signUpPasswordFieldLocator = "signUp-password-field"
        static let signUpSignUpButtonLocator = "signUp-signUp-button"
    }
    
    // MARK: - MovieVCLocators
    struct MovieVCLocators {
        static let moviesTableViewLocator = XCUIApplication().tables[UIAccessibleIdentifiers.MovieVC.moviesTableView]
        static let moviesNavigationBarTitleLocator = XCUIApplication().navigationBars.staticTexts[UIAccessibleIdentifiers.MovieVC.moviesNavigationBarTitle]
    }

    // MARK: - MovieCellLocators
    struct MovieCellLocators {
        static let movieTableViewCellLocator = XCUIApplication().tables[UIAccessibleIdentifiers.MovieVC.moviesTableView].cells
        static let movieCellImageViewLocator = XCUIApplication().images[UIAccessibleIdentifiers.MovieCell.movieCellImageView]
        static let movieCellTitleLabelLocator = XCUIApplication().staticTexts[UIAccessibleIdentifiers.MovieCell.movieCellTitleLabel]
        static let movieCellStarImageViewLocator = XCUIApplication().images[UIAccessibleIdentifiers.MovieCell.movieCellStarImageView]
        static let movieCellAverageVoteLabelLocator = XCUIApplication().staticTexts[UIAccessibleIdentifiers.MovieCell.movieCellAverageVoteLabel]
        static let movieCellReleaseDateLabelLocator = XCUIApplication().staticTexts[UIAccessibleIdentifiers.MovieCell.movieCellReleaseDateLabel]
    }

    // MARK: - MovieDetailVCLocators
    struct MovieDetailVCLocators {
        static let backButtonLocator = XCUIApplication().navigationBars[UIAccessibleIdentifiers.MovieDetailVC.movieDetailNavigationBar].buttons["Back"]
        static let movieDetailNavigationBarTitleLocator = XCUIApplication().navigationBars[UIAccessibleIdentifiers.MovieDetailVC.movieDetailNavigationBar]
        static let movieDetailImageViewLocator = XCUIApplication().images[UIAccessibleIdentifiers.MovieDetailVC.movieDetailImageView]
        static let movieDetailTagLineLabelLocator = XCUIApplication().staticTexts[UIAccessibleIdentifiers.MovieDetailVC.movieDetailTagLineLabel]
        static let movieDetailStarImageLabelLocator = XCUIApplication().images[UIAccessibleIdentifiers.MovieDetailVC.movieDetailStarImageLabel]
        static let movieDetailAverageVoteLabelLocator = XCUIApplication().staticTexts[UIAccessibleIdentifiers.MovieDetailVC.movieDetailAverageVoteLabel]
        static let movieDetailGenresLabelLocator = XCUIApplication().staticTexts[UIAccessibleIdentifiers.MovieDetailVC.movieDetailGenresLabel]
        static let movieDetailReleaseDateLabelLocator = XCUIApplication().staticTexts[UIAccessibleIdentifiers.MovieDetailVC.movieDetailReleaseDateLabel]
        static let movieDetailOverviewLabelLocator = XCUIApplication().staticTexts[UIAccessibleIdentifiers.MovieDetailVC.movieDetailOverviewLabel]
        static let movieDetailAddToWatchlistButtonLocator = XCUIApplication().buttons[UIAccessibleIdentifiers.MovieDetailVC.movieDetailAddToWatchButton]
        static let movieDetailMakeCommentButtonLocator = XCUIApplication().buttons[UIAccessibleIdentifiers.MovieDetailVC.movieDetailMakeCommentButton]
        static let movieDetailOfficialButtonLocator = XCUIApplication().buttons[UIAccessibleIdentifiers.MovieDetailVC.movieDetailOfficialButton]
        static let movieDetailImdbButtonLocator = XCUIApplication().buttons[UIAccessibleIdentifiers.MovieDetailVC.movieDetailImdbButton]
        static let movieDetailFavButtonLocator = XCUIApplication().buttons[UIAccessibleIdentifiers.MovieDetailVC.movieDetailFavButton]
        static let movieDetailAllHorizontalViewLocator = XCUIApplication().otherElements[UIAccessibleIdentifiers.MovieDetailVC.movieDetailAllHorizontalView]
        static let movieDetailButtonViewLocator = XCUIApplication().otherElements[UIAccessibleIdentifiers.MovieDetailVC.movieDetailButtonView]
    }

    // MARK: - CustomPopupVCLocators
    struct CustomPopupVCLocators {
        static let popupWindowPopupViewLocator = XCUIApplication().otherElements[UIAccessibleIdentifiers.CustomPopupVC.popupWindowPopupView]
        static let popupWindowPopupLabelLocator = XCUIApplication().staticTexts[UIAccessibleIdentifiers.CustomPopupVC.popupWindowPopupLabel]
        static let popupWindowPopupTextViewLocator = XCUIApplication().textViews[UIAccessibleIdentifiers.CustomPopupVC.popupWindowPopupTextView]
        static let popupWindowPopupButtonLocator = XCUIApplication().buttons[UIAccessibleIdentifiers.CustomPopupVC.popupWindowPopupButton]

    }

    // MARK: - CustomToastMessageLocators
    struct CustomToastMessageLocators {
        static let addedToWatchlistAlertLocator = XCUIApplication().alerts.staticTexts[UIAccessibleIdentifiers.CustomToastMessage.addedToWatchlistAlert]
        static let remowedFromWatchlistAlertLocator = XCUIApplication().alerts.staticTexts[UIAccessibleIdentifiers.CustomToastMessage.remowedFromWatchlistAlert]
        static let addedToFavoritesAlertLocator = XCUIApplication().alerts.staticTexts[UIAccessibleIdentifiers.CustomToastMessage.addedToFavoritesAlert]
        static let remowedFromFavoritesAlertLocator = XCUIApplication().alerts.staticTexts[UIAccessibleIdentifiers.CustomToastMessage.remowedFromFavoritesAlert]
        static let popupBlankMessageAlertLocator = XCUIApplication().alerts.staticTexts[UIAccessibleIdentifiers.CustomToastMessage.popupBlankMessageAlert]
        static let popupThanksMessageAlertLocator = XCUIApplication().alerts.staticTexts[UIAccessibleIdentifiers.CustomToastMessage.popupThanksMessageAlert]
    }
}
