//
//  ItemModelTest.swift
//  Recruitment-iOSTests
//
//  Created by Krzysztof Niestrój on 10/02/2019.
//  Copyright © 2019 Untitled Kingdom. All rights reserved.
//

import XCTest
@testable import Recruitment_iOS

class ItemModelTest: XCTestCase {
    func testItemModelNil() {
        // given
        let data: [String: AnyObject] = [:]

        // when
        let itemModel = ItemDetailsModel(with: data)

        // then
        XCTAssertNil(itemModel)
    }

    func testCreationOfRedItemModel() {
        // given
        let attributes: [String: AnyObject] = ["name": "Item999" as AnyObject, "color": "Red" as AnyObject]
        let data: [String: AnyObject] = ["id": "999" as AnyObject, "attributes": attributes as AnyObject]

        // when
        let itemModel = ItemModel(with: data)

        // then
        XCTAssertNotNil(itemModel)
        XCTAssertEqual(itemModel?.idx, "999")
        XCTAssertEqual(itemModel?.name, "Item999")
        XCTAssertEqual(itemModel?.color, UIColor.red)
        XCTAssertEqual(itemModel?.preview, "")
    }

    func testCreationOfBlueItemModel() {
        // given
        let attributes: [String: AnyObject] = ["name": "Item999" as AnyObject, "color": "Blue" as AnyObject]
        let data: [String: AnyObject] = ["id": "999" as AnyObject, "attributes": attributes as AnyObject]

        // when
        let itemModel = ItemModel(with: data)

        // then
        XCTAssertNotNil(itemModel)
        XCTAssertEqual(itemModel?.idx, "999")
        XCTAssertEqual(itemModel?.name, "Item999")
        XCTAssertEqual(itemModel?.color, UIColor.blue)
        XCTAssertEqual(itemModel?.preview, "")
    }

    func testCreationOfYellowItemModel() {
        // given
        let attributes: [String: AnyObject] = ["name": "Item999" as AnyObject, "color": "Yellow" as AnyObject]
        let data: [String: AnyObject] = ["id": "999" as AnyObject, "attributes": attributes as AnyObject]

        // when
        let itemModel = ItemModel(with: data)

        // then
        XCTAssertNotNil(itemModel)
        XCTAssertEqual(itemModel?.idx, "999")
        XCTAssertEqual(itemModel?.name, "Item999")
        XCTAssertEqual(itemModel?.color, UIColor.yellow)
        XCTAssertEqual(itemModel?.preview, "")
    }

    func testCreationOfPurpleItemModel() {
        // given
        let attributes: [String: AnyObject] = ["name": "Item999" as AnyObject, "color": "Purple" as AnyObject]
        let data: [String: AnyObject] = ["id": "999" as AnyObject, "attributes": attributes as AnyObject]

        // when
        let itemModel = ItemModel(with: data)

        // then
        XCTAssertNotNil(itemModel)
        XCTAssertEqual(itemModel?.idx, "999")
        XCTAssertEqual(itemModel?.name, "Item999")
        XCTAssertEqual(itemModel?.color, UIColor.purple)
        XCTAssertEqual(itemModel?.preview, "")
    }

    func testCreationOfDefaultColorItemModel() {
        // given
        let attributes: [String: AnyObject] = ["name": "Item999" as AnyObject, "color": "Magenta" as AnyObject]
        let data: [String: AnyObject] = ["id": "999" as AnyObject, "attributes": attributes as AnyObject]

        // when
        let itemModel = ItemModel(with: data)

        // then
        XCTAssertNotNil(itemModel)
        XCTAssertEqual(itemModel?.idx, "999")
        XCTAssertEqual(itemModel?.name, "Item999")
        XCTAssertEqual(itemModel?.color, UIColor.black)
        XCTAssertEqual(itemModel?.preview, "")
    }

    func testCreationOfItemModelWithPreview() {
        // given
        let attributes: [String: AnyObject] = ["name": "Item1" as AnyObject, "color": "Green" as AnyObject,
                                               "preview": "Lorem ipsum dolor sit amet" as AnyObject]
        let data: [String: AnyObject] = ["id": "1" as AnyObject, "attributes": attributes as AnyObject]

        // when
        let itemModel = ItemModel(with: data)

        // then
        XCTAssertNotNil(itemModel)
        XCTAssertEqual(itemModel?.idx, "1")
        XCTAssertEqual(itemModel?.name, "Item1")
        XCTAssertEqual(itemModel?.color, UIColor.green)
        XCTAssertEqual(itemModel?.preview, "Lorem ipsum dolor sit amet")
    }
}
