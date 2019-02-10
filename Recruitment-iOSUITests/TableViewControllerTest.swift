//
//  TableViewControllerTest.swift
//  Recruitment-iOSTests
//
//  Created by Krzysztof Niestrój on 10/02/2019.
//  Copyright © 2019 Untitled Kingdom. All rights reserved.
//

import XCTest
@testable import Recruitment_iOS

class TableViewControllerTest: XCTestCase {
    let app = XCUIApplication()

    override func setUp() {
        super.setUp()

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        app.launch()
        app.buttons["START"].tap()
    }

    override func tearDown() {
        app.buttons["Back"].tap()
        super.tearDown()
    }

    func testFirstCellContent() {
        // given
        let cells = app.tables.cells

        // then
        XCTAssertNotNil(cells.staticTexts["Item2"])
        XCTAssertNotNil(cells.staticTexts["Lorem ipsum dolor sit amet, consectetur adipiscing elit."])
    }

    func testSecondCellTap() {
        // given
        let predicate = NSPredicate(format: "value BEGINSWITH 'Lorem ipsum dolor sit amet'")
        let textView = app.textViews.element(matching: predicate)
        expectation(for: NSPredicate(format: "exists == true"), evaluatedWith: textView, handler: nil)

        // when
        app.tables.cells.staticTexts["Item1"].tap()

        // then
        XCTAssertTrue(app.navigationBars["ItEm1"].exists)
        waitForExpectations(timeout: 5, handler: nil)
    }
}
