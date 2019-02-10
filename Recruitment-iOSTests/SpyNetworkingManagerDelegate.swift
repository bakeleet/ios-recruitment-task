//
//  SpyNetworkingManagerDelegate.swift
//  Recruitment-iOS
//
//  Created by Krzysztof Niestrój on 10/02/2019.
//  Copyright © 2019 Untitled Kingdom. All rights reserved.
//

import XCTest
@testable import Recruitment_iOS

class SpyNetworkingManagerDelegate: NetworkingManagerDelegate {
    var itemModels: [ItemModel]?
    var itemDetailsModel: ItemDetailsModel?
    var requestExpectation: XCTestExpectation?

    func downloadedItems(_ items: [ItemModel]) {
        guard let expectation = requestExpectation else {
            XCTFail("missing XCTExpectation reference")
            return
        }

        itemModels = items
        expectation.fulfill()
    }

    func downloadedItemDetails(_ itemDetails: ItemDetailsModel) {
        guard let expectation = requestExpectation else {
            XCTFail("missing XCTExpectation reference")
            return
        }

        itemDetailsModel = itemDetails
        expectation.fulfill()
    }
}
