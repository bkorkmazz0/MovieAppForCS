//
//  MovieVCUITest.swift
//  MovieAppForCSUITests
//
//  Created by Berkan Korkmaz on 29.12.2022.
//

import XCTest

final class MovieVCUITest: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testScrollingTableView() throws {

        let tableView = app.tables[UIAccessibleIdentifiers.MovieVC.moviesTableView].cells
        let numberOfRows = tableView

        // Scroll to the last row
        let lastIndexPath = IndexPath(row: numberOfRows - 1, section: 0)
        tableView.scrollToRow(at: lastIndexPath, at: .bottom, animated: false)

        // Verify that the last cell is visible
        let lastCell = tableView.cellForRow(at: lastIndexPath)
        XCTAssertNotNil(lastCell)

        // Scroll to the first row
        let firstIndexPath = IndexPath(row: 0, section: 0)
        tableView.scrollToRow(at: firstIndexPath, at: .top, animated: false)

        // Verify that the first cell is visible
        let firstCell = tableView.cellForRow(at: firstIndexPath)
        XCTAssertNotNil(firstCell)
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
