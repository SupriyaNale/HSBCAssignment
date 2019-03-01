//
//  LoginViewUITests.swift
//  HSBCOnlineTestTests
//
//  Created by Admin on 3/1/19.
//  Copyright © 2019 CG. All rights reserved.
//

import XCTest

class LoginViewUITests: XCTestCase {

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
    
    func testUserName() {
        let userNameTextField = self.app.textFields["userNameTextField"]
        userNameTextField.tap()
        userNameTextField.typeText("hsbc")
        XCTAssert((userNameTextField.value as! String) == mockUsername)
    }
    
    func testPassword() {
        let userNameTextField = self.app.textFields["passwordTextField"]
        userNameTextField.tap()
        userNameTextField.typeText("hsbc")
        XCTAssert((userNameTextField.value as! String) == mockPassword)
    }
    
    func testLogin() {
        testUserName()
        testPassword()
        self.app.buttons["login_login"].tap()
        XCTAssertTrue(true)
    }

}
