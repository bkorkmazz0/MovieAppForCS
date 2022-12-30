//
//  MovieVCUITest.swift
//  MovieAppForCSUITests
//
//  Created by Berkan Korkmaz on 29.12.2022.
//

import XCTest

class MovieVCUITest: XCTestCase {

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

    func testAllItemsVerifyCase() {

        let moviesNavigationBarTitle = app.navigationBars.staticTexts[UITestConstant.MovieVC.moviesNavigationBarTitle]

        let tableViewCell = app.tables[UITestConstant.MovieVC.moviesTableView].cells.element(boundBy: 0)

        let cellTitleLabel = tableViewCell.staticTexts[UITestConstant.MovieCell.movieCellTitleLabel]
        let cellAverageVoteLabel = tableViewCell.staticTexts[UITestConstant.MovieCell.movieCellAverageVoteLabel]
        let cellReleaseDateLabel = tableViewCell.staticTexts[UITestConstant.MovieCell.movieCellReleaseDateLabel]
        let cellImageView = tableViewCell.images[UITestConstant.MovieCell.movieCellImageView]
        let cellStarImageView = tableViewCell.images[UITestConstant.MovieCell.movieCellStarImageView]
        let toDetailButton = tableViewCell.buttons[UITestConstant.MovieCell.movieCellDirectButton]

        XCTAssertTrue(moviesNavigationBarTitle.exists)

        XCTAssertTrue(tableViewCell.exists)

        XCTAssertTrue(cellTitleLabel.exists)
        XCTAssertTrue(cellAverageVoteLabel.exists)
        XCTAssertTrue(cellReleaseDateLabel.exists)
        XCTAssertTrue(cellImageView.exists)
        XCTAssertTrue(cellStarImageView.exists)
        XCTAssertTrue(toDetailButton.exists)

    }

    func testCellToDetailCase() {

        let tableViewCell = app.tables[UITestConstant.MovieVC.moviesTableView].cells.element(boundBy: 0)

        let cellTitleLabel = tableViewCell.staticTexts[UITestConstant.MovieCell.movieCellTitleLabel]
        let cellText = cellTitleLabel.label

        let backButton = app.navigationBars[UITestConstant.MovieDetailVC.movieDetailNavigationBar].buttons["Back"]

        cellTitleLabel.tap()
        sleep(1)
        XCTAssertTrue(app.staticTexts[cellText].exists)
        backButton.tap()

    }

    func testScrollingTableViewCase() {

        let tableViewCell = app.tables[UITestConstant.MovieVC.moviesTableView].cells.element(boundBy: 0)

        let cellTitleLabel = tableViewCell.staticTexts[UITestConstant.MovieCell.movieCellTitleLabel]
        let cellText = cellTitleLabel.label

        let backButton = app.navigationBars[UITestConstant.MovieDetailVC.movieDetailNavigationBar].buttons["Back"]

        cellTitleLabel.tap()
        sleep(1)
        XCTAssertTrue(app.staticTexts[cellText].exists)
        backButton.tap()

    }

//    // Scroll down
//    tableView.swipeUp()
//
//    // Verify that the last cell is visible
//    let lastCell = tableView.cells.element(boundBy: tableView.cells.count - 1)
//    XCTAssertTrue(lastCell.isHittable)
//
//    // Scroll up
//    tableView.swipeDown()
//
//    // Verify that the first cell is visible
//    let firstCell = tableView.cells.element(boundBy: 0)
//    XCTAssertTrue(firstCell.isHittable)

//            // Scroll down
//        let lastRowIndex = tableView.numberOfRows(inSection: 0) - 1
//        let lastRowIndexPath = IndexPath(row: lastRowIndex, section: 0)
//        let lastCell = tableView.cellForRow(at: lastRowIndexPath)
//        XCTAssert(lastCell.isVisible, "Last cell is not visible")
//
//        // Scroll up
//        let firstRowIndexPath = IndexPath(row: 0, section: 0)
//        let firstCell = tableView.cellForRow(at: firstRowIndexPath)
//        XCTAssert(firstCell.isVisible, "First cell is not visible")

}
