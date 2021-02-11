//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    var app = XCUIApplication()
    
    private var firstChild: XCUIElement {
        return app.tables.children(matching: .cell).element(boundBy: 0)
    }
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testCreateNewThread() {
        let titleTextField = app.tables.staticTexts["Create a new thread:"]
        titleTextField.tap()
        
    }
    
    func testUICreateMessage() {
        firstChild.tap()
        let createMessageExpectation = expectation(for: NSPredicate(format: "count == 2"), evaluatedWith: app.tables.cells)
        createMessageExpectation.expectationDescription = "Messages should increase to 2"
        app.navigationBars.buttons["Add"].tap()
        app.textFields["Enter your name:"].tap()
        app.typeText("Brys")
        app.navigationBars["New Message"].buttons["Send"].tap()
        waitForExpectations(timeout: 3)
    }
    
    func testCancelButton() {
        let predicate = NSPredicate(format: "count == 1")
        
        firstChild.tap()
        app.navigationBars.buttons["Add"].tap()
        let cancelButtonExpectation = expectation(for: predicate, evaluatedWith: app.tables.cells, handler: nil)
        cancelButtonExpectation.expectationDescription = "Table view should be visible"
        app.navigationBars.buttons["Cancel"].tap()
        waitForExpectations(timeout: 2)
    }
    
    
    

               
    
    
}
