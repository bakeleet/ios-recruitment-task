//
//  NetworkingManagerTest.swift
//  Recruitment-iOSTests
//
//  Created by Krzysztof Niestrój on 10/02/2019.
//  Copyright © 2019 Untitled Kingdom. All rights reserved.
//

import XCTest
@testable import Recruitment_iOS

// NetworkingManager should be mocked with something similar to the existing implementation of request.
// It would be a little troublesome, because of its nature - it is a singleton.
// The most feasible way would be to create fake init where mocked requesting implementation could be injected.
class NetworkingManagerTest: XCTestCase {
    var networkingManagerDelegateSpy: SpyNetworkingManagerDelegate!

    override func setUp() {
        super.setUp()
        networkingManagerDelegateSpy = SpyNetworkingManagerDelegate()
    }

    override func tearDown() {
        networkingManagerDelegateSpy = nil
        super.tearDown()
    }

    func testDownloadItems() {
        // given
        NetworkingManager.sharedManager.delegate = networkingManagerDelegateSpy
        networkingManagerDelegateSpy.requestExpectation = expectation(description: "trying to download all items")

        // when
        NetworkingManager.sharedManager.downloadItems()

        // then
        waitForExpectations(timeout: 3) { error in
            if let error = error {
                XCTFail("waitForExpectations error: \(error)")
            }

            guard let items = self.networkingManagerDelegateSpy.itemModels else {
                XCTFail("items were not downloaded")
                return
            }

            XCTAssertNotNil(items)
            XCTAssertEqual(items.count, 5)
        }
    }

    func testDownloadItemWithID() {
        // given
        NetworkingManager.sharedManager.delegate = networkingManagerDelegateSpy
        networkingManagerDelegateSpy.requestExpectation = expectation(description: "trying to download item with id 3")

        // when
        NetworkingManager.sharedManager.downloadItemWithID("3")

        // then
        waitForExpectations(timeout: 3) { error in
            if let error = error {
                XCTFail("waitForExpectations error: \(error)")
            }

            guard let itemDetail = self.networkingManagerDelegateSpy.itemDetailsModel else {
                XCTFail("item details were not downloaded")
                return
            }

            XCTAssertNotNil(itemDetail)
            XCTAssertEqual(itemDetail.idx, "3")
            XCTAssertEqual(itemDetail.name, "Item3")
            XCTAssertEqual(itemDetail.color, UIColor.yellow)
            XCTAssertTrue(itemDetail.desc.starts(with: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."))
        }
    }
}
