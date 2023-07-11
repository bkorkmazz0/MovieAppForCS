//
//  MovieVCUITest.swift
//  MovieAppForCSUITests
//
//  Created by Berkan Korkmaz on 29.12.2022.
//

import XCTest

class MovieUITest: XCTestCase {

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

    func test_MovieHome_ItemsVerify() {

        clickTabBar(1)
        waitForElement(UITestLocators.MovieVCLocators.moviesTableViewLocator)
        XCTAssertTrue(isTabSelected(1))

        XCTAssertTrue(UITestLocators.MovieVCLocators.moviesNavigationBarTitleLocator.exists)
        XCTAssertTrue(UITestLocators.MovieVCLocators.moviesTableViewLocator.exists)

        XCTAssertTrue(UITestLocators.MovieCellLocators.movieTableViewCellLocator.element(boundBy: 0).exists)
        XCTAssertTrue(UITestLocators.MovieCellLocators.movieCellImageViewLocator.exists)
        XCTAssertTrue(UITestLocators.MovieCellLocators.movieCellTitleLabelLocator.exists)
        XCTAssertTrue(UITestLocators.MovieCellLocators.movieCellStarImageViewLocator.exists)
        XCTAssertTrue(UITestLocators.MovieCellLocators.movieCellAverageVoteLabelLocator.exists)
        XCTAssertTrue(UITestLocators.MovieCellLocators.movieCellReleaseDateLabelLocator.exists)

    }

    func test_MovieHome_GoToDetailPageFromHome() {
        
        clickTabBar(1)
        waitForElement(UITestLocators.MovieVCLocators.moviesTableViewLocator)
        XCTAssertTrue(isTabSelected(1))

        let cell = UITestLocators.MovieCellLocators.movieTableViewCellLocator.element(boundBy: 0)
        let cellTitle = cell.staticTexts[UIAccessibleIdentifiers.MovieCell.movieCellTitleLabel]
        let cellTitleLabel = cellTitle.label

        cell.tap()

        waitForElement(UITestLocators.MovieDetailVCLocators.movieDetailNavigationBarTitleLocator)

        XCTAssertTrue(app.staticTexts[cellTitleLabel].exists)

        goToBack()

        XCTAssertTrue(cell.exists)

    }

    func test_MovieHome_GetRequestToSecondPage() {

        clickTabBar(1)
        waitForElement(UITestLocators.MovieVCLocators.moviesTableViewLocator)
        XCTAssertTrue(isTabSelected(1))
        
        let lastCell = UITestLocators.MovieCellLocators.movieTableViewCellLocator.element(boundBy: 24)

        pageSwipeUp(lastCell)
        waitForElement(lastCell)

        let lastCellTitle = lastCell.staticTexts[UIAccessibleIdentifiers.MovieCell.movieCellTitleLabel]
        let lastCellTitleLabel = lastCellTitle.label

        XCTAssertTrue(app.staticTexts[lastCellTitleLabel].exists)

    }

    func test_MovieHome_ScrollingTopToBottomAndReverse() {

        clickTabBar(1)
        waitForElement(UITestLocators.MovieVCLocators.moviesTableViewLocator)
        XCTAssertTrue(isTabSelected(1))
        
        let firstCell = UITestLocators.MovieCellLocators.movieTableViewCellLocator.element(boundBy: 0)

        let lastCell = UITestLocators.MovieCellLocators.movieTableViewCellLocator.element(boundBy: UITestLocators.MovieCellLocators.movieTableViewCellLocator.count - 1)

        pageSwipeUp(lastCell)
        waitForElement(lastCell)

        let lastCellTitle = lastCell.staticTexts[UIAccessibleIdentifiers.MovieCell.movieCellTitleLabel]
        let lastCellTitleLabel = lastCellTitle.label
        XCTAssertTrue(app.staticTexts[lastCellTitleLabel].exists)

        pageSwipeDown(firstCell)
        waitForElement(firstCell)

        let firstCellTitle = firstCell.staticTexts[UIAccessibleIdentifiers.MovieCell.movieCellTitleLabel]
        let firstCellTitleLabel = firstCellTitle.label
        XCTAssertTrue(app.staticTexts[firstCellTitleLabel].exists)

    }
}
