//
//  ItemDetailsModelTest.swift
//  Recruitment-iOSTests
//
//  Created by Krzysztof Niestrój on 10/02/2019.
//  Copyright © 2019 Untitled Kingdom. All rights reserved.
//

import XCTest
@testable import Recruitment_iOS

class ItemDetailsModelTest: XCTestCase {
    func testItemModelNil() {
        // given
        let data: [String: AnyObject] = [:]

        // when
        let itemModel = ItemModel(with: data)

        // then
        XCTAssertNil(itemModel)
    }

    func testCreationOfItemModelWithPreview() {
        // given
        let attributes: [String: AnyObject] = ["name": "Item1" as AnyObject, "color": "Green" as AnyObject,
                                               "desc": "Lorem ipsum dolor sit amet" as AnyObject]
        let data: [String: AnyObject] = ["id": "1" as AnyObject, "attributes": attributes as AnyObject]

        // when
        let itemModel = ItemDetailsModel(with: data)

        // then
        XCTAssertNotNil(itemModel)
        XCTAssertEqual(itemModel?.idx, "1")
        XCTAssertEqual(itemModel?.name, "Item1")
        XCTAssertEqual(itemModel?.color, UIColor.green)
        XCTAssertEqual(itemModel?.preview, "")
        XCTAssertEqual(itemModel?.desc, "Lorem ipsum dolor sit amet")
    }
}
