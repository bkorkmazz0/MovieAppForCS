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

    func testHomeItemsVerifyCase() {

        let moviesNavigationBarTitle = app.navigationBars.staticTexts[UITestConstant.MovieVC.moviesNavigationBarTitle]

        let tableViewCell = app.tables[UITestConstant.MovieVC.moviesTableView].cells.element(boundBy: 0)

        let cellTitleLabel = tableViewCell.staticTexts[UITestConstant.MovieCell.movieCellTitleLabel]
        let cellAverageVoteLabel = tableViewCell.staticTexts[UITestConstant.MovieCell.movieCellAverageVoteLabel]
        let cellReleaseDateLabel = tableViewCell.staticTexts[UITestConstant.MovieCell.movieCellReleaseDateLabel]
        let cellImageView = tableViewCell.images[UITestConstant.MovieCell.movieCellImageView]
        let cellStarImageView = tableViewCell.images[UITestConstant.MovieCell.movieCellStarImageView]

        sleep(1)
        
        XCTAssertTrue(moviesNavigationBarTitle.exists)
        
        XCTAssertTrue(tableViewCell.exists)
        
        XCTAssertTrue(cellTitleLabel.exists)
        XCTAssertTrue(cellAverageVoteLabel.exists)
        XCTAssertTrue(cellReleaseDateLabel.exists)
        XCTAssertTrue(cellImageView.exists)
        XCTAssertTrue(cellStarImageView.exists)

    }

    func testCellToDetailCase() {

        let tableViewCell = app.tables[UITestConstant.MovieVC.moviesTableView].cells.element(boundBy: 0)

        let cellTitleLabel = tableViewCell.staticTexts[UITestConstant.MovieCell.movieCellTitleLabel]
        let cellText = cellTitleLabel.label
        cellTitleLabel.tap()

        let backButton = app.navigationBars[UITestConstant.MovieDetailVC.movieDetailNavigationBar].buttons["Back"]

        sleep(1)
        
        XCTAssertTrue(app.staticTexts[cellText].exists)
        
        backButton.tap()

    }

    func testGetSecondPageInTableViewCase() {

        let tableView = app.tables[UITestConstant.MovieVC.moviesTableView]
        let lastCell = tableView.cells.element(boundBy: 24)

        let MAX_SCROLLS = 10
        var count = 0
        while lastCell.isHittable == false && count < MAX_SCROLLS {
            app.swipeUp()
            count += 1
        }
        
        let cellTitleLabel = lastCell.staticTexts[UITestConstant.MovieCell.movieCellTitleLabel]
        XCTAssertTrue(cellTitleLabel.exists)

    }
    
    func testScrollingTableViewCase() {

        let tableView = app.tables[UITestConstant.MovieVC.moviesTableView]
        let lastCell = tableView.cells.element(boundBy: 19)
        let firstCell = tableView.cells.element(boundBy: 0)
        
        let MAX_SCROLLS = 10
        var count1 = 0
        var count2 = 0
        
        while lastCell.isHittable == false && count1 < MAX_SCROLLS {
            app.swipeUp()
            count1 += 1
        }
        
        let lastCellTitleLabel = lastCell.staticTexts[UITestConstant.MovieCell.movieCellTitleLabel]
        XCTAssertTrue(lastCellTitleLabel.exists)

        while firstCell.isHittable == false && count2 < MAX_SCROLLS {
            app.swipeDown()
            count2 += 1
        }
        
        let firstCellTitleLabel = firstCell.staticTexts[UITestConstant.MovieCell.movieCellTitleLabel]
        XCTAssertTrue(firstCellTitleLabel.exists)
        
    }
}
