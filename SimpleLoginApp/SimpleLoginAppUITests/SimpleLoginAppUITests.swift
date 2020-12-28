//
//  SimpleLoginAppUITests.swift
//  SimpleLoginAppUITests
//
//  Created by Sravya Kaki on 12/23/20.
//  Copyright © 2020 Sravya Kaki. All rights reserved.
//

import XCTest

class SimpleLoginAppUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
          super.setUp()
          app = XCUIApplication()
          app.launch()
          continueAfterFailure = false
    }
    
    func testUsernameTextField() {
        let dummyUsername = "Sravya123"
        let usernameText = app.textFields["USERNAME"]
        XCTAssertTrue(usernameText.exists, "Username field is empty")
        usernameText.tap()
        usernameText.typeText(dummyUsername)
    }
    
    func testPasswordTextField() {
        let dummyPassword = "Hello123"
        let passwordText = app.textFields["PASSWORD"]
        XCTAssertTrue(passwordText.exists, "Password field is empty")
        
        passwordText.tap()
        passwordText.typeText(dummyPassword)
    }
    
    func testLoginBtn() {
        let loginButton = app.buttons["LOGINBTN"]
        XCTAssertTrue(loginButton.exists, "Login button is missing")
        loginButton.tap()
    }
}
