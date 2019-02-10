//
//  CollectionViewControllerTest.swift
//  Recruitment-iOSUITests
//
//  Created by Krzysztof Niestrój on 10/02/2019.
//  Copyright © 2019 Untitled Kingdom. All rights reserved.
//

import XCTest
@testable import Recruitment_iOS

// This is aweful, but at least I tried.
class CollectionViewControllerTest: XCTestCase {
    let app = XCUIApplication()

    override func setUp() {
        super.setUp()

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        app.launch()
        app.buttons["START"].tap()

        // This occurs to be the only way to wait for user interaction to be enabled ;(
        // Trying to SpyNetworkingManagerDelegate ends with "symbol not found for protocol descriptor
        // for Recruitment_iOS.NetworkingManagerDelegate" linker error for some reason.
        let delayExpectation = expectation(description: "waiting for user interaction to be enabled")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.app.tabBars.buttons["Collection"].tap()
            delayExpectation.fulfill()
        }
        waitForExpectations(timeout: 5) { error in
            if let error = error {
                XCTFail("waitForExpectations error: \(error)")
            }
        }
    }

    override func tearDown() {
        app.buttons["Back"].tap()
        super.tearDown()
    }

    func testFourthCellContent() {
        XCTAssertNotNil(app.collectionViews.cells.staticTexts["Item4"])
    }

    func testFifthCellTap() {
        // given
        let predicate = NSPredicate(format: "value BEGINSWITH 'Lorem ipsum dolor sit amet'")
        let textView = app.textViews.element(matching: predicate)
        expectation(for: NSPredicate(format: "exists == true"), evaluatedWith: textView, handler: nil)
        let buttonExpectation = expectation(description: "waiting to click item button")

        // when
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.app.collectionViews.cells.staticTexts["Item5"].tap()
            buttonExpectation.fulfill()
        }
        wait(for: [buttonExpectation], timeout: 5)

        // then
        XCTAssertTrue(self.app.navigationBars["ItEm5"].exists)
        waitForExpectations(timeout: 5, handler: nil)
    }
}
