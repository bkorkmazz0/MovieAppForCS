//
//  AccountUITest.swift
//  MovieAppForCS
//
//  Created by Berkan Korkmaz on 23.04.2023.
//

import XCTest

class AccountUITest: XCTestCase {

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

    func test_AccountTab_ItemsVerify() {
        
        toLogout()

        waitForElement(UITestLocators.AccountVCLocators.accountImageViewLocator)

        XCTAssertTrue(UITestLocators.TabBarLocators.tabBarLocator.exists)

        clickTabBar(2)
        XCTAssertTrue(isTabSelected(2))

        XCTAssertTrue(UITestLocators.AccountVCLocators.accountNavigationBarTitleLocator.exists)
        XCTAssertTrue(UITestLocators.AccountVCLocators.accountImageViewLocator.exists)
        XCTAssertTrue(UITestLocators.AccountVCLocators.accountTableViewLocator.exists)
        XCTAssertTrue(UITestLocators.AccountVCLocators.accountTableViewCellLocator.staticTexts["Sign In"].exists)
        XCTAssertTrue(UITestLocators.AccountVCLocators.accountTableViewCellLocator.staticTexts["Create Account"].exists)

    }

    func test_SignInPage_ItemsVerify() {
        
        toLogout()

        clickTabBar(2)
        XCTAssertTrue(isTabSelected(2))

        UITestLocators.AccountVCLocators.accountTableViewCellLocator.staticTexts["Sign In"].tap()

        waitForElement(app.navigationBars["Sign In"].staticTexts["Sign In"])

        XCTAssertTrue(app.images["signHeaderView-image-view"].exists)
        XCTAssertTrue(app.staticTexts["signHeaderView-label"].exists)
        XCTAssertTrue(app.textFields["signIn-email-field"].exists)
        XCTAssertTrue(app.secureTextFields["signIn-password-field"].exists)
        XCTAssertTrue(app.buttons["signIn-signIn-button"].exists)
        XCTAssertTrue(app.buttons["signIn-create-account-button"].exists)

    }

    func test_CreateAccountPage_ItemsVerify() {
        
        toLogout()

        clickTabBar(2)
        XCTAssertTrue(isTabSelected(2))

        UITestLocators.AccountVCLocators.accountTableViewCellLocator.staticTexts["Create Account"].tap()

        waitForElement(app.navigationBars["Create Account"].staticTexts["Create Account"])

        XCTAssertTrue(app.images["signHeaderView-image-view"].exists)
        XCTAssertTrue(app.staticTexts["signHeaderView-label"].exists)
        XCTAssertTrue(app.textFields["signUp-full-name-field"].exists)
        XCTAssertTrue(app.textFields["signUp-email-field"].exists)
        XCTAssertTrue(app.secureTextFields["signUp-password-field"].exists)
        XCTAssertTrue(app.buttons["signUp-signUp-button"].exists)

    }
    
    func test_CreateAccountButtonInSignInPage_ItemVerify() {
        
        toLogout()

        clickTabBar(2)
        XCTAssertTrue(isTabSelected(2))
        
        app.tables["account-table-view"].staticTexts["Sign In"].tap()
        XCTAssertTrue(app.buttons["signIn-create-account-button"].exists)

        app.staticTexts["Create Account"].tap()
        XCTAssertTrue(app.navigationBars["Create Account"].buttons["close"].exists)
        XCTAssertTrue(app.navigationBars["Create Account"].exists)
        XCTAssertTrue(app.images["signHeaderView-image-view"].exists)
        XCTAssertTrue(app.staticTexts["signHeaderView-label"].exists)
        XCTAssertTrue(app.textFields["signUp-full-name-field"].exists)
        XCTAssertTrue(app.textFields["signUp-email-field"].exists)
        XCTAssertTrue(app.secureTextFields["signUp-password-field"].exists)
        XCTAssertTrue(app.buttons["signUp-signUp-button"].exists)
        
        app.navigationBars["Create Account"].buttons["close"].tap()
        waitForElement(app.images["signHeaderView-image-view"])
        XCTAssertTrue(app.buttons["signIn-create-account-button"].exists)
        
    }

    func test_ifUserIsNotLoggedIn_ThenLoginCase() {
        
        toLogout()

        clickTabBar(2)
        XCTAssertTrue(isTabSelected(2))

        UITestLocators.AccountVCLocators.accountTableViewCellLocator.staticTexts["Sign In"].tap()

        waitForElement(app.navigationBars["Sign In"].staticTexts["Sign In"])

        let emailTextField = app.textFields["signIn-email-field"]
        let passwordTextField = app.secureTextFields["signIn-password-field"]

        emailTextField.tap()
        emailTextField.typeText("berkan@gmail.com")
        app.keyboards.buttons["Sürdür"].tap()

        passwordTextField.tap()
        passwordTextField.typeText("password")

        app.buttons["signIn-signIn-button"].tap()

        waitForElement(app.navigationBars["Profile"])
        XCTAssertTrue(app.buttons["Sign Out"].exists)
        
        toLogout()
        
    }
    
    func test_SignInPage_Validation() {
        
        toLogout()

        clickTabBar(2)
        XCTAssertTrue(isTabSelected(2))

        UITestLocators.AccountVCLocators.accountTableViewCellLocator.staticTexts["Sign In"].tap()

        waitForElement(app.navigationBars["Sign In"].staticTexts["Sign In"])
        let dismissButton = app.alerts["Woops"].scrollViews.otherElements.buttons["Dismiss"]

        app.buttons["Sign In"].tap()
        XCTAssertTrue(dismissButton.exists)
        dismissButton.tap()
        
        let signInEmailTextField = app.textFields["signIn-email-field"]
        signInEmailTextField.tap()
        signInEmailTextField.typeText("deneme")
        
        app.buttons["Sign In"].tap()
        XCTAssertTrue(dismissButton.exists)
        dismissButton.tap()
        
        signInEmailTextField.tap()
        app.keyboards.keys["delete"].press(forDuration: 2)

        let signInPasswordTextField = app.secureTextFields["signIn-password-field"]
        signInPasswordTextField.tap()
        signInPasswordTextField.typeText("test")
        
        app.buttons["Sign In"].tap()
        XCTAssertTrue(dismissButton.exists)
        dismissButton.tap()
        
        signInEmailTextField.tap()
        signInEmailTextField.typeText("deneme")
        
        app.buttons["Sign In"].tap()
        XCTAssertTrue(dismissButton.exists)
        dismissButton.tap()
        
    }
    
    func test_CreateAccountPage_Validation() {
        
        toLogout()

        clickTabBar(2)
        XCTAssertTrue(isTabSelected(2))

        UITestLocators.AccountVCLocators.accountTableViewCellLocator.staticTexts["Create Account"].tap()

        waitForElement(app.navigationBars["Create Account"].staticTexts["Create Account"])
        let dismissButton = app.alerts["Woops"].scrollViews.otherElements.buttons["Dismiss"]

        app.buttons["Sign Up"].tap()
        XCTAssertTrue(dismissButton.exists)
        dismissButton.tap()
        
        let signUpFullNameTextField = app.textFields["signUp-full-name-field"]
        signUpFullNameTextField.tap()
        signUpFullNameTextField.typeText("berkan")
        
        app.buttons["Sign Up"].tap()
        XCTAssertTrue(dismissButton.exists)
        dismissButton.tap()
        
        signUpFullNameTextField.tap()
        app.keyboards.keys["delete"].press(forDuration: 2)
        
        let signUpEmailTextField = app.textFields["signUp-email-field"]
        signUpEmailTextField.tap()
        signUpEmailTextField.typeText("deneme")
        
        app.buttons["Sign Up"].tap()
        XCTAssertTrue(dismissButton.exists)
        dismissButton.tap()
        
        signUpEmailTextField.tap()
        app.keyboards.keys["delete"].press(forDuration: 2)

        let signUpPasswordTextField = app.secureTextFields["signUp-password-field"]
        signUpPasswordTextField.tap()
        signUpPasswordTextField.typeText("test")
        
        app.buttons["Sign Up"].tap()
        XCTAssertTrue(dismissButton.exists)
        dismissButton.tap()
        
    }
}
