//
//  MovieDetailVCUITest.swift
//  MovieAppForCSUITests
//
//  Created by Berkan Korkmaz on 29.12.2022.
//

import XCTest

class MovieDetailVCUITest: XCTestCase {

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

    func testDetailItemsVerifyCase() {

        let tableViewCell = app.tables[UITestConstant.MovieVC.moviesTableView].cells.element(boundBy: 0)
        tableViewCell.tap()

        let detailNavBarTitle = app.navigationBars[UITestConstant.MovieDetailVC.movieDetailNavigationBar]
        let detailImageView = app.images[UITestConstant.MovieDetailVC.movieDetailImageView]
        let detailAddToWatchButton = app.buttons[UITestConstant.MovieDetailVC.movieDetailAddToWatchButton]
        let detailCommentButton = app.buttons[UITestConstant.MovieDetailVC.movieDetailMakeCommentButton]
        let detailTagLineLabel = app.staticTexts[UITestConstant.MovieDetailVC.movieDetailTagLineLabel]
        let detailGenresLabel = app.staticTexts[UITestConstant.MovieDetailVC.movieDetailGenresLabel]
        let detailStarImageView = app.images[UITestConstant.MovieDetailVC.movieDetailStarImageLabel]
        let detailAverageVoteLabel = app.staticTexts[UITestConstant.MovieDetailVC.movieDetailAverageVoteLabel]
        let detailReleaseDateLabel = app.staticTexts[UITestConstant.MovieDetailVC.movieDetailReleaseDateLabel]
        let detailAllHorizontalView = app.otherElements[UITestConstant.MovieDetailVC.movieDetailAllHorizontalView]
        let detailOverviewLabel = app.staticTexts[UITestConstant.MovieDetailVC.movieDetailOverviewLabel]
        let detailOfficialButton = app.buttons[UITestConstant.MovieDetailVC.movieDetailOfficialButton]
        let detailImdbButton = app.buttons[UITestConstant.MovieDetailVC.movieDetailImdbButton]
        let detailFavButton = app.buttons[UITestConstant.MovieDetailVC.movieDetailFavButton]
        let detailButtonView = app.otherElements[UITestConstant.MovieDetailVC.movieDetailButtonView]

        sleep(1)

        XCTAssertTrue(detailNavBarTitle.exists)
        XCTAssertTrue(detailImageView.exists)
        XCTAssertTrue(detailAddToWatchButton.exists)
        XCTAssertTrue(detailCommentButton.exists)
        XCTAssertTrue(detailTagLineLabel.exists)
        XCTAssertTrue(detailGenresLabel.exists)
        XCTAssertTrue(detailStarImageView.exists)
        XCTAssertTrue(detailAverageVoteLabel.exists)
        XCTAssertTrue(detailReleaseDateLabel.exists)
        XCTAssertTrue(detailAllHorizontalView.exists)
        XCTAssertTrue(detailOverviewLabel.exists)
        XCTAssertTrue(detailOfficialButton.exists)
        XCTAssertTrue(detailImdbButton.exists)
        XCTAssertTrue(detailFavButton.exists)
        XCTAssertTrue(detailButtonView.exists)

    }

    func testAddToWatchButtonVerifyCase() {

        let tableViewCell = app.tables[UITestConstant.MovieVC.moviesTableView].cells.element(boundBy: 0)
        tableViewCell.tap()

        let detailAddToWatchButton = app.buttons[UITestConstant.MovieDetailVC.movieDetailAddToWatchButton]
        detailAddToWatchButton.tap()

        let addedToWatchlistAlert = app.alerts.scrollViews.otherElements.staticTexts[UITestConstant.CustomToastMessage.addedToWatchlistAlert]
        let remowedFromWatchlistAlert = app.alerts.scrollViews.otherElements.staticTexts[UITestConstant.CustomToastMessage.remowedFromWatchlistAlert]

        XCTAssertTrue(addedToWatchlistAlert.exists)

        detailAddToWatchButton.tap()

        XCTAssertTrue(remowedFromWatchlistAlert.exists)

    }

    func testFavButtonVerifyCase() {

        let tableViewCell = app.tables[UITestConstant.MovieVC.moviesTableView].cells.element(boundBy: 0)
        tableViewCell.tap()

        let detailFavButton = app.buttons[UITestConstant.MovieDetailVC.movieDetailFavButton]
        detailFavButton.tap()

        let addedToFavoritesAlert = app.alerts.scrollViews.otherElements.staticTexts[UITestConstant.CustomToastMessage.addedToFavoritesAlert]
        let remowedFromFavoritesAlert = app.alerts.scrollViews.otherElements.staticTexts[UITestConstant.CustomToastMessage.remowedFromFavoritesAlert]

        XCTAssertTrue(addedToFavoritesAlert.exists)

        detailFavButton.tap()

        XCTAssertTrue(remowedFromFavoritesAlert.exists)

    }

    func testOfficialButtonVerifyCase() {

        let tableViewCell = app.tables[UITestConstant.MovieVC.moviesTableView].cells.element(boundBy: 0)
        tableViewCell.tap()

        let myApp = XCUIApplication(bundleIdentifier: "co.berkan.MovieAppForCS")
        let safariWebPage = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")

        let detailOfficialButton = app.buttons[UITestConstant.MovieDetailVC.movieDetailOfficialButton]
        detailOfficialButton.tap()

        XCTAssertTrue(safariWebPage.exists)

        myApp.activate()

        XCTAssertTrue(detailOfficialButton.exists)

    }

    func testIMDbButtonVerifyCase() {

        let tableViewCell = app.tables[UITestConstant.MovieVC.moviesTableView].cells.element(boundBy: 0)
        tableViewCell.tap()

        let myApp = XCUIApplication(bundleIdentifier: "co.berkan.MovieAppForCS")
        let safariWebPage = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")

        let detailIMDbButton = app.buttons[UITestConstant.MovieDetailVC.movieDetailImdbButton]
        detailIMDbButton.tap()

        XCTAssertTrue(safariWebPage.exists)

        myApp.activate()

        XCTAssertTrue(detailIMDbButton.exists)

    }

    func testPopupViewItemsVerifyCase() {

        let tableViewCell = app.tables[UITestConstant.MovieVC.moviesTableView].cells.element(boundBy: 0)
        tableViewCell.tap()

        let detailCommentButton = app.buttons[UITestConstant.MovieDetailVC.movieDetailMakeCommentButton]
        detailCommentButton.tap()

        let popupWindowPopupView = app.otherElements[UITestConstant.CustomPopupVC.popupWindowPopupView]
        let popupWindowPopupLabel = app.staticTexts[UITestConstant.CustomPopupVC.popupWindowPopupLabel]
        let popupWindowPopupTextView = app.textViews[UITestConstant.CustomPopupVC.popupWindowPopupTextView]
        let popupWindowPopupButton = app.buttons[UITestConstant.CustomPopupVC.popupWindowPopupButton]

        XCTAssertTrue(popupWindowPopupView.exists)
        XCTAssertTrue(popupWindowPopupLabel.exists)
        XCTAssertTrue(popupWindowPopupTextView.exists)
        XCTAssertTrue(popupWindowPopupButton.exists)

    }

    func testPopupViewFunctionsVerifyCase() {

        let tableViewCell = app.tables[UITestConstant.MovieVC.moviesTableView].cells.element(boundBy: 0)
        tableViewCell.tap()

        let backButton = app.navigationBars[UITestConstant.MovieDetailVC.movieDetailNavigationBar].buttons["Back"]

        let detailCommentButton = app.buttons[UITestConstant.MovieDetailVC.movieDetailMakeCommentButton]
        detailCommentButton.tap()

        let popupBlankMessageAlert = app.alerts.scrollViews.otherElements.staticTexts[UITestConstant.CustomToastMessage.popupBlankMessageAlert]
        let popupThanksMessageAlert = app.alerts.scrollViews.otherElements.staticTexts[UITestConstant.CustomToastMessage.popupThanksMessageAlert]

        let popupWindowPopupView = app.otherElements[UITestConstant.CustomPopupVC.popupWindowPopupView]
        let popupWindowPopupLabel = app.staticTexts[UITestConstant.CustomPopupVC.popupWindowPopupLabel]
        let popupWindowPopupTextView = app.textViews[UITestConstant.CustomPopupVC.popupWindowPopupTextView]
        let popupWindowPopupButton = app.buttons[UITestConstant.CustomPopupVC.popupWindowPopupButton]

        sleep(1)

        XCTAssertTrue(popupWindowPopupView.exists)
        popupWindowPopupLabel.tap()

        sleep(1)

        XCTAssertTrue(detailCommentButton.exists)
        detailCommentButton.tap()
        popupWindowPopupButton.tap()

        XCTAssertTrue(popupBlankMessageAlert.exists)

        sleep(1)

        popupWindowPopupTextView.tap()
        popupWindowPopupTextView.typeText("Hello Test")
        popupWindowPopupButton.tap()

        XCTAssertTrue(popupThanksMessageAlert.exists)

        sleep(2)

        backButton.tap()

    }

}
