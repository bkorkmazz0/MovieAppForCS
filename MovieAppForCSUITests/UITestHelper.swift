//
//  UITestHelper.swift
//  MovieAppForCSUITests
//
//  Created by Berkan Korkmaz on 7.01.2023.
//

import XCTest

extension XCTestCase {

    func goToBack() {
        XCUIApplication().navigationBars.buttons.element(boundBy: 0).tap()
    }

    func waitForElement(_ element: XCUIElement, timeout: TimeInterval = 5.0) {
        let existsPredicate = NSPredicate(format: "exists == true")

        expectation(for: existsPredicate, evaluatedWith: element, handler: nil)

        waitForExpectations(timeout: timeout) { (error) in
            if error != nil {
                XCTFail("Failed to find element after waiting for it to appear.")
            }
        }
    }

    func pageSwipeUp(_ cell: XCUIElement) {
        let MAX_SCROLLS = 10
        var count = 0

        while cell.isHittable == false && count < MAX_SCROLLS {
            XCUIApplication().swipeUp()
            count += 1
        }
    }

    func pageSwipeDown(_ cell: XCUIElement) {
        let MAX_SCROLLS = 10
        var count = 0

        while cell.isHittable == false && count < MAX_SCROLLS {
            XCUIApplication().swipeDown()
            count += 1
        }
    }
    
    func clickTabBar(_ tabBarIndex: Int) {
        let tabBar = XCUIApplication().tabBars.element
        
        let tabBarItem = tabBar.buttons.element(boundBy: tabBarIndex)
        tabBarItem.tap()
    }
    
    func isTabSelected(_ selectedIndex: Int) -> Bool {
        let tabBar = XCUIApplication().tabBars.element
        
        let TabBarItem = tabBar.buttons.element(boundBy: selectedIndex)
        return TabBarItem.isSelected
    }
    
    func isSearchBarKeyboardOpen(searchBar: XCUIElement) -> Bool {
        searchBar.tap()
        
        return XCUIApplication().keyboards.count > 0
    }
    
    func isLogin() -> Bool {
        clickTabBar(2)
        if UITestLocators.AccountVCLocators.accountImageViewLocator.exists {
            return false
        } else {
            return true
        }
    }
    
    func toLogout() {
        
        if isLogin() {
            let signOutButton = XCUIApplication().navigationBars["Profile"].buttons["Sign Out"]
            let signOutButtonOptions = XCUIApplication().scrollViews.otherElements
            
            signOutButton.tap()
            signOutButtonOptions.buttons["Cancel"].tap()
            XCTAssertTrue(XCUIApplication().buttons["Sign Out"].exists)
            
            signOutButton.tap()
            signOutButtonOptions.buttons["Sign Out"].tap()
            
            waitForElement(UITestLocators.AccountVCLocators.accountImageViewLocator)
            XCTAssertTrue(UITestLocators.AccountVCLocators.accountNavigationBarTitleLocator.exists)

        }
    }
    
}
