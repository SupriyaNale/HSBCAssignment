//
//  HSBCOnlineTestUITests.swift
//  HSBCOnlineTestUITests
//
//  Created by Admin on 2/26/19.
//  Copyright © 2019 CG. All rights reserved.
//

import XCTest

class HSBCOnlineTestUITests: XCTestCase {

    let app = XCUIApplication()
    let mockUsername = "hsbc"
    let mockPassword = "1234556"
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testuserName() {
        let userNameTextField = app.textFields["userNameTextField"]
        userNameTextField.tap()
        userNameTextField.typeText("hsbc")
        XCTAssert((userNameTextField.value as! String) == mockUsername)
    }
    
    func testPassword() {
        let passwordTextField = self.app.textFields["passwordTextField"]
        passwordTextField.tap()
        passwordTextField.typeText("hsbc")
        XCTAssert((passwordTextField.value as! String) == mockPassword)
    }
    
    func testLogin() {
        testuserName()
        testPassword()
        self.app.buttons["login_login"].tap()
        XCTAssertTrue(true)
    }
}
