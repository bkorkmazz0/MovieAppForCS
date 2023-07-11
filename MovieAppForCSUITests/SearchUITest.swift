//
//  SearchUITest.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 23.04.2023.
//

import XCTest

class SearchUITest: XCTestCase {

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
    
    let searchNavigationBar = XCUIApplication().navigationBars["Search"]
    let searchBar = XCUIApplication().searchFields["Find films..."]
    
    func test_TabBarItems_ClearlyWorking() {
        
        clickTabBar(1)
        waitForElement(UITestLocators.MovieVCLocators.moviesTableViewLocator)
        XCTAssertTrue(isTabSelected(1))
        XCTAssertTrue(UITestLocators.MovieVCLocators.moviesNavigationBarTitleLocator.exists)

        clickTabBar(0)
        waitForElement(searchNavigationBar)
        XCTAssertTrue(isTabSelected(0))
        XCTAssertTrue(searchBar.exists)

    }
    
    func test_SearchTab_ItemsVerify() {
        
        clickTabBar(0)
        waitForElement(searchNavigationBar)
        XCTAssertTrue(isTabSelected(0))
        
        XCTAssertTrue(searchNavigationBar.staticTexts["Search"].exists)
        XCTAssertTrue(searchBar.exists)
        
        searchBar.tap()
        XCTAssertTrue(searchNavigationBar.buttons["Cancel"].exists)
        XCTAssertTrue(isSearchBarKeyboardOpen(searchBar: searchBar))
        searchNavigationBar.buttons["Cancel"].tap()
        
        XCTAssertTrue(searchNavigationBar.staticTexts["Search"].exists)
        searchBar.tap()
        XCTAssertTrue(isSearchBarKeyboardOpen(searchBar: searchBar))
        searchBar.typeText("batman")
        //TO DO assert
        searchBar.buttons["Clear text"].tap()
        searchBar.typeText("batman")

        app.keyboards.buttons["Ara"].tap()
        searchNavigationBar.buttons["Cancel"].tap()
        
    }
    
    func test_SearchTab_ScrollingTopToBottomAndReverse() {
        
        clickTabBar(0)
        waitForElement(searchNavigationBar)
        XCTAssertTrue(isTabSelected(0))
        
        XCTAssertTrue(searchNavigationBar.staticTexts["Search"].exists)
        XCTAssertTrue(searchBar.exists)
        
        searchBar.tap()
        XCTAssertTrue(isSearchBarKeyboardOpen(searchBar: searchBar))
        searchBar.typeText("batman")
        app.keyboards.buttons["Ara"].tap()

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
