//
//  MovieDetailVCUITest.swift
//  MovieAppForCSUITests
//
//  Created by Berkan Korkmaz on 29.12.2022.
//

import XCTest

class MovieDetailUITest: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_MovieDetail_ItemsVerify() {

        waitForElement(UITestLocators.MovieVCLocators.moviesTableViewLocator)

        UITestLocators.MovieCellLocators.movieTableViewCellLocator.element(boundBy: 0).tap()

        waitForElement(UITestLocators.MovieDetailVCLocators.movieDetailImageViewLocator)

        XCTAssertTrue(UITestLocators.MovieDetailVCLocators.backButtonLocator.exists)
        XCTAssertTrue(UITestLocators.MovieDetailVCLocators.movieDetailNavigationBarTitleLocator.exists)
        XCTAssertTrue(UITestLocators.MovieDetailVCLocators.movieDetailImageViewLocator.exists)
        XCTAssertTrue(UITestLocators.MovieDetailVCLocators.movieDetailTagLineLabelLocator.exists)
        XCTAssertTrue(UITestLocators.MovieDetailVCLocators.movieDetailStarImageLabelLocator.exists)
        XCTAssertTrue(UITestLocators.MovieDetailVCLocators.movieDetailAverageVoteLabelLocator.exists)
        XCTAssertTrue(UITestLocators.MovieDetailVCLocators.movieDetailGenresLabelLocator.exists)
        XCTAssertTrue(UITestLocators.MovieDetailVCLocators.movieDetailReleaseDateLabelLocator.exists)
        XCTAssertTrue(UITestLocators.MovieDetailVCLocators.movieDetailOverviewLabelLocator.exists)
        XCTAssertTrue(UITestLocators.MovieDetailVCLocators.movieDetailAddToWatchlistButtonLocator.exists)
        XCTAssertTrue(UITestLocators.MovieDetailVCLocators.movieDetailMakeCommentButtonLocator.exists)
        XCTAssertTrue(UITestLocators.MovieDetailVCLocators.movieDetailOfficialButtonLocator.exists)
        XCTAssertTrue(UITestLocators.MovieDetailVCLocators.movieDetailImdbButtonLocator.exists)
        XCTAssertTrue(UITestLocators.MovieDetailVCLocators.movieDetailFavButtonLocator.exists)
        XCTAssertTrue(UITestLocators.MovieDetailVCLocators.movieDetailAllHorizontalViewLocator.exists)
        XCTAssertTrue(UITestLocators.MovieDetailVCLocators.movieDetailButtonViewLocator.exists)

    }

    func test_MovieDetail_AddToWatchButton() {

        waitForElement(UITestLocators.MovieVCLocators.moviesTableViewLocator)

        UITestLocators.MovieCellLocators.movieTableViewCellLocator.element(boundBy: 0).tap()

        waitForElement(UITestLocators.MovieDetailVCLocators.movieDetailImageViewLocator)

        let addToWatchlistButton = UITestLocators.MovieDetailVCLocators.movieDetailAddToWatchlistButtonLocator
        let addedToWatchlistAlertLocator = UITestLocators.CustomToastMessageLocators.addedToWatchlistAlertLocator
        let remowedFromWatchlistAlertLocator = UITestLocators.CustomToastMessageLocators.remowedFromWatchlistAlertLocator

        XCTAssertTrue(addToWatchlistButton.exists)
        addToWatchlistButton.tap()

        XCTAssertTrue(addedToWatchlistAlertLocator.exists)
        waitForElement(addedToWatchlistAlertLocator)
        addToWatchlistButton.tap()

        XCTAssertTrue(remowedFromWatchlistAlertLocator.exists)

    }

    func test_MovieDetail_FavButton() {

        waitForElement(UITestLocators.MovieVCLocators.moviesTableViewLocator)

        UITestLocators.MovieCellLocators.movieTableViewCellLocator.element(boundBy: 0).tap()

        waitForElement(UITestLocators.MovieDetailVCLocators.movieDetailImageViewLocator)

        let favButton = UITestLocators.MovieDetailVCLocators.movieDetailFavButtonLocator
        let addedToFavoritesAlert = UITestLocators.CustomToastMessageLocators.addedToFavoritesAlertLocator
        let remowedFromFavoritesAlert = UITestLocators.CustomToastMessageLocators.remowedFromFavoritesAlertLocator

        XCTAssertTrue(favButton.exists)
        favButton.tap()

        XCTAssertTrue(addedToFavoritesAlert.exists)
        waitForElement(addedToFavoritesAlert)
        favButton.tap()

        XCTAssertTrue(remowedFromFavoritesAlert.exists)

    }

    func test_MovieDetail_OfficialButton() {

        waitForElement(UITestLocators.MovieVCLocators.moviesTableViewLocator)

        UITestLocators.MovieCellLocators.movieTableViewCellLocator.element(boundBy: 0).tap()

        waitForElement(UITestLocators.MovieDetailVCLocators.movieDetailImageViewLocator)

        let myApp = XCUIApplication(bundleIdentifier: "co.berkan.MovieAppForCS")
        let safariWebPage = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")

        let detailOfficialButton = UITestLocators.MovieDetailVCLocators.movieDetailOfficialButtonLocator
        detailOfficialButton.tap()

        XCTAssertTrue(safariWebPage.exists)
        waitForElement(safariWebPage)
        
        let urlButton = safariWebPage.textFields["Address"]
        if urlButton.exists { urlButton.tap() }
        let urlButtonText = urlButton.value as! String
        
        let verifyText = "https://www."

        XCTAssertTrue(urlButtonText.contains(verifyText))

        myApp.activate()

        XCTAssertTrue(detailOfficialButton.exists)

    }

    func test_MovieDetail_IMDbButton() {

        waitForElement(UITestLocators.MovieVCLocators.moviesTableViewLocator)

        UITestLocators.MovieCellLocators.movieTableViewCellLocator.element(boundBy: 0).tap()

        waitForElement(UITestLocators.MovieDetailVCLocators.movieDetailImageViewLocator)

        let myApp = XCUIApplication(bundleIdentifier: "co.berkan.MovieAppForCS")
        let safariWebPage = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")

        let detailIMDbButton = UITestLocators.MovieDetailVCLocators.movieDetailImdbButtonLocator
        detailIMDbButton.tap()

        XCTAssertTrue(safariWebPage.exists)
        waitForElement(safariWebPage)

        let urlButton = safariWebPage.textFields["Address"]
        if urlButton.exists { urlButton.tap() }

        let urlButtonText = urlButton.value as! String

        let verifyText = "https://m.imdb.com/"

        XCTAssertTrue(urlButtonText.contains(verifyText))

        myApp.activate()

        XCTAssertTrue(detailIMDbButton.exists)

    }

    func test_MovieDetail_PopupView_ItemsVerify() {

        waitForElement(UITestLocators.MovieVCLocators.moviesTableViewLocator)

        UITestLocators.MovieCellLocators.movieTableViewCellLocator.element(boundBy: 0).tap()

        waitForElement(UITestLocators.MovieDetailVCLocators.movieDetailImageViewLocator)

        UITestLocators.MovieDetailVCLocators.movieDetailMakeCommentButtonLocator.tap()

        XCTAssertTrue(UITestLocators.CustomPopupVCLocators.popupWindowPopupViewLocator.exists)
        XCTAssertTrue(UITestLocators.CustomPopupVCLocators.popupWindowPopupLabelLocator.exists)
        XCTAssertTrue(UITestLocators.CustomPopupVCLocators.popupWindowPopupTextViewLocator.exists)
        XCTAssertTrue(UITestLocators.CustomPopupVCLocators.popupWindowPopupButtonLocator.exists)

    }

    func test_MovieDetail_PopupView() {

        waitForElement(UITestLocators.MovieVCLocators.moviesTableViewLocator)

        UITestLocators.MovieCellLocators.movieTableViewCellLocator.element(boundBy: 0).tap()

        waitForElement(UITestLocators.MovieDetailVCLocators.movieDetailImageViewLocator)

        let detailCommentButton = UITestLocators.MovieDetailVCLocators.movieDetailMakeCommentButtonLocator
        detailCommentButton.tap()

        let popupBlankMessageAlert = UITestLocators.CustomToastMessageLocators.popupBlankMessageAlertLocator
        let popupThanksMessageAlert = UITestLocators.CustomToastMessageLocators.popupThanksMessageAlertLocator

        let popupWindowPopupView = UITestLocators.CustomPopupVCLocators.popupWindowPopupViewLocator
        let popupWindowPopupLabel = UITestLocators.CustomPopupVCLocators.popupWindowPopupLabelLocator
        let popupWindowPopupTextView = UITestLocators.CustomPopupVCLocators.popupWindowPopupTextViewLocator
        let popupWindowPopupButton = UITestLocators.CustomPopupVCLocators.popupWindowPopupButtonLocator

        XCTAssertTrue(popupWindowPopupView.exists)
        popupWindowPopupLabel.tap()

        XCTAssertTrue(detailCommentButton.exists)
        detailCommentButton.tap()
        popupWindowPopupButton.tap()

        XCTAssertTrue(popupBlankMessageAlert.exists)

        popupWindowPopupTextView.tap()
        popupWindowPopupTextView.typeText("Hello Test")
        popupWindowPopupButton.tap()

        XCTAssertTrue(popupThanksMessageAlert.exists)

        waitForElement(UITestLocators.MovieDetailVCLocators.backButtonLocator)

        XCTAssertTrue(detailCommentButton.exists)

        goToBack()

        XCTAssertTrue(UITestLocators.MovieVCLocators.moviesNavigationBarTitleLocator.exists)

    }

}
