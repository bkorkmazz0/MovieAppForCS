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
    
    func testDetailAllItemsVerifyCase() {
        
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
    
    
    
    
    
    
    
    
    
    

//    func testScrollingTableView() throws {
//
        //exist
//        
//        let app = app2
//        app.tables["movies-table-view"]/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Avatar: The Way of Water").element.press(forDuration: 0.3);/*[[".cells.containing(.staticText, identifier:\"7.9\").element",".tap()",".press(forDuration: 0.3);",".cells.containing(.staticText, identifier:\"Avatar: The Way of Water\").element"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
//        
//        let elementsQuery = app.scrollViews.otherElements
//        elementsQuery/*@START_MENU_TOKEN@*/.staticTexts["movie-detail-overview-label"]/*[[".staticTexts[\"Set more than a decade after the events of the first film, learn the story of the Sully family (Jake, Neytiri, and their kids), the trouble that follows them, the lengths they go to keep each other safe, the battles they fight to stay alive, and the tragedies they endure.\"]",".staticTexts[\"movie-detail-overview-label\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
//        elementsQuery.images["movie-detail-image-view"].swipeDown()
//        
//        let movieDetailAddToWatchButtonButton = app/*@START_MENU_TOKEN@*/.buttons["movie-detail-add-to-watch-button"]/*[[".scrollViews",".buttons[\"Add to home screen\"]",".buttons[\"movie-detail-add-to-watch-button\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
//        movieDetailAddToWatchButtonButton/*@START_MENU_TOKEN@*/.press(forDuration: 0.1);/*[[".tap()",".press(forDuration: 0.1);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        movieDetailAddToWatchButtonButton/*@START_MENU_TOKEN@*/.press(forDuration: 0.1);/*[[".tap()",".press(forDuration: 0.1);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        
//        let movieDetailMakeCommentButtonButton = app/*@START_MENU_TOKEN@*/.buttons["movie-detail-make-comment-button"]/*[[".scrollViews",".buttons[\"compose\"]",".buttons[\"movie-detail-make-comment-button\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
//        movieDetailMakeCommentButtonButton/*@START_MENU_TOKEN@*/.press(forDuration: 0.1);/*[[".tap()",".press(forDuration: 0.1);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        app.windows.children(matching: .other).element.children(matching: .other).element/*@START_MENU_TOKEN@*/.press(forDuration: 0.0);/*[[".tap()",".press(forDuration: 0.0);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        movieDetailMakeCommentButtonButton/*@START_MENU_TOKEN@*/.press(forDuration: 0.2);/*[[".tap()",".press(forDuration: 0.2);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        
//        let popupWindowPopupButtonButton = app/*@START_MENU_TOKEN@*/.buttons["popup-window-popup-button"]/*[[".otherElements[\"popup-window-popup-view\"]",".buttons[\"Make Comment\"]",".buttons[\"popup-window-popup-button\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
//        popupWindowPopupButtonButton/*@START_MENU_TOKEN@*/.press(forDuration: 0.1);/*[[".tap()",".press(forDuration: 0.1);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        
//        let app2 = app
//        app2/*@START_MENU_TOKEN@*/.textViews["popup-window-popup-text-view"].press(forDuration: 0.1);/*[[".otherElements[\"popup-window-popup-view\"].textViews[\"popup-window-popup-text-view\"]",".tap()",".press(forDuration: 0.1);",".textViews[\"popup-window-popup-text-view\"]"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
//        app2/*@START_MENU_TOKEN@*/.keys["D"].press(forDuration: 0.1);/*[[".keyboards.keys[\"D\"]",".tap()",".press(forDuration: 0.1);",".keys[\"D\"]"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
//        app2/*@START_MENU_TOKEN@*/.keys["f"].press(forDuration: 0.1);/*[[".keyboards.keys[\"f\"]",".tap()",".press(forDuration: 0.1);",".keys[\"f\"]"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
//        app2/*@START_MENU_TOKEN@*/.keys["g"].press(forDuration: 0.1);/*[[".keyboards.keys[\"g\"]",".tap()",".press(forDuration: 0.1);",".keys[\"g\"]"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
//        popupWindowPopupButtonButton/*@START_MENU_TOKEN@*/.press(forDuration: 0.1);/*[[".tap()",".press(forDuration: 0.1);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        
//        let movieDetailFavButtonButton = app/*@START_MENU_TOKEN@*/.buttons["movie-detail-fav-button"]/*[[".buttons[\"love\"]",".buttons[\"movie-detail-fav-button\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        movieDetailFavButtonButton/*@START_MENU_TOKEN@*/.press(forDuration: 0.1);/*[[".tap()",".press(forDuration: 0.1);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        movieDetailFavButtonButton/*@START_MENU_TOKEN@*/.press(forDuration: 0.1);/*[[".tap()",".press(forDuration: 0.1);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        app2/*@START_MENU_TOKEN@*/.staticTexts["IMDb"].press(forDuration: 0.1);/*[[".buttons[\"IMDb\"].staticTexts[\"IMDb\"]",".tap()",".press(forDuration: 0.1);",".buttons[\"movie-detail-imdb-button\"].staticTexts[\"IMDb\"]",".staticTexts[\"IMDb\"]"],[[[-1,4,1],[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
//        
//        let breadcrumbButton = app2/*@START_MENU_TOKEN@*/.scrollViews.otherElements.statusBars.buttons["breadcrumb"]/*[[".windows[\"SBSwitcherWindow\"]",".otherElements[\"AppSwitcherContentView\"]",".otherElements[\"Safari\"].scrollViews.otherElements.statusBars",".buttons[\"Git: Movies\"]",".buttons[\"breadcrumb\"]",".otherElements[\"card:com.apple.mobilesafari:sceneID:com.apple.mobilesafari-4B741241-3019-4EB0-BBD8-AC3265487B0F\"].scrollViews.otherElements.statusBars",".scrollViews.otherElements.statusBars"],[[[-1,6,3],[-1,5,3],[-1,2,3],[-1,1,2],[-1,0,1]],[[-1,6,3],[-1,5,3],[-1,2,3],[-1,1,2]],[[-1,6,3],[-1,5,3],[-1,2,3]],[[-1,4],[-1,3]]],[0,0]]@END_MENU_TOKEN@*/
//        breadcrumbButton/*@START_MENU_TOKEN@*/.press(forDuration: 0.1);/*[[".tap()",".press(forDuration: 0.1);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        app2/*@START_MENU_TOKEN@*/.staticTexts["Official"].press(forDuration: 0.1);/*[[".buttons[\"Official\"].staticTexts[\"Official\"]",".tap()",".press(forDuration: 0.1);",".buttons[\"movie-detail-official-button\"].staticTexts[\"Official\"]",".staticTexts[\"Official\"]"],[[[-1,4,1],[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
//        breadcrumbButton/*@START_MENU_TOKEN@*/.press(forDuration: 0.1);/*[[".tap()",".press(forDuration: 0.1);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        app.navigationBars["navgation-bar"].buttons["Back"]/*@START_MENU_TOKEN@*/.press(forDuration: 0.1);/*[[".tap()",".press(forDuration: 0.1);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        
//    }
}
