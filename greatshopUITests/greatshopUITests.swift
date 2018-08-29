//
//  greatshopUITests.swift
//  greatshopUITests
//
//  Created by soaltomas on 24.03.2018.
//  Copyright © 2018 soaltomas. All rights reserved.
//

import XCTest

class greatshopUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func waitForElementToAppear(element: XCUIElement, timeout: TimeInterval = 5,  file: String = #file, line: UInt = #line) {
        let existsPredicate = NSPredicate(format: "exists == true")
        
        expectation(for: existsPredicate,
                    evaluatedWith: element, handler: nil)
        
        waitForExpectations(timeout: timeout) { (error) -> Void in
            if (error != nil) {
                let message = "Failed to find \(element) after \(timeout) seconds."
                self.recordFailure(withDescription: message, inFile: file, atLine: Int(line), expected: true)
            }
        }
    }
    
    func testExample() {
        
        let app = XCUIApplication()
        app.textFields["username"].tap()
        app.textFields["username"].typeText("test")
        let passwordSecureTextField = app.secureTextFields["password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("test")
        app.buttons["Log In"].tap()
       // let label = app.staticTexts["Welcome!"]
      //  self.waitForElementToAppear(element: label)
        app.staticTexts["Welcome!"].tap()
        app.staticTexts["John Doe"].tap()
        
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["Product"].tap()
        
        let tablesQuery = app.tables
        tablesQuery.searchFields["Search"].tap()
        tablesQuery.searchFields["Search"].typeText("Мышка")
        tabBarsQuery.buttons["Basket"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["45600"]/*[[".cells.staticTexts[\"45600\"]",".staticTexts[\"45600\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
        app.buttons["Pay"].tap()
        tabBarsQuery.buttons["Settings"].tap()
        
        tablesQuery.children(matching: .cell).element(boundBy: 0).children(matching: .textField).element.tap()
        tablesQuery.children(matching: .cell).element(boundBy: 0).children(matching: .textField).element.typeText("test")
        tablesQuery.children(matching: .cell).element(boundBy: 1).children(matching: .secureTextField).element.tap()
        tablesQuery.children(matching: .cell).element(boundBy: 1).children(matching: .secureTextField).element.typeText("test")
        
        let tablesQuery2 = tablesQuery
        tablesQuery2/*@START_MENU_TOKEN@*/.textFields["E-Mail"]/*[[".cells.textFields[\"E-Mail\"]",".textFields[\"E-Mail\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery2/*@START_MENU_TOKEN@*/.textFields["E-Mail"]/*[[".cells.textFields[\"E-Mail\"]",".textFields[\"E-Mail\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.typeText("test")
        
        let xxxxXxxxXxxxXxxxTextField = tablesQuery2/*@START_MENU_TOKEN@*/.textFields["xxxx-xxxx-xxxx-xxxx"]/*[[".cells.textFields[\"xxxx-xxxx-xxxx-xxxx\"]",".textFields[\"xxxx-xxxx-xxxx-xxxx\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        xxxxXxxxXxxxXxxxTextField.tap()
        xxxxXxxxXxxxXxxxTextField.typeText("test")
        
        let maleStaticText = tablesQuery2/*@START_MENU_TOKEN@*/.staticTexts["Male"]/*[[".cells.staticTexts[\"Male\"]",".staticTexts[\"Male\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        maleStaticText.tap()
        tablesQuery2/*@START_MENU_TOKEN@*/.pickerWheels["Male"]/*[[".cells",".pickers.pickerWheels[\"Male\"]",".pickerWheels[\"Male\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        tablesQuery2/*@START_MENU_TOKEN@*/.pickerWheels["None"].press(forDuration: 1.7)
       // maleStaticText.tap()
        app.navigationBars["Settings"].buttons["Done"].tap()
        let alert = app.alerts["Successfully"].buttons["Ok"]
        self.waitForElementToAppear(element: alert)
        app.alerts["Successfully"].buttons["Ok"].tap()
        app.tabBars.buttons["Product"].tap()
    }
    
}
