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

}
