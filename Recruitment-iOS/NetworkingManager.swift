//
//  NetworkingManager.swift
//  UKiOSTest
//
//  Created by Paweł Sporysz on 15.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit

protocol NetworkingManagerDelegate: class {
    func downloadedItems(_ items: [ItemModel])
    func downloadedItemDetails(_ itemDetails: ItemDetailsModel)
}

class NetworkingManager: NSObject {
    static var sharedManager = NetworkingManager()
    weak var delegate: NetworkingManagerDelegate?

    func downloadItems() {
        request(filename: "Items.json") { dictionary in
            guard let data = dictionary["data"] as? [[String: AnyObject]] else {
                Logger.DLog(message: "failed unwrapping")
                return
            }

            var result: [ItemModel] = []

            for item in data {
                guard let itemModel = ItemModel(with: item) else {
                    Logger.DLog(message: "failed unwrapping")
                    return
                }

                result.append(itemModel)
            }

            self.delegate?.downloadedItems(result)
        }
    }

    func downloadItemWithID(_ idx: String) {
        let filename = "Item\(idx).json"

        request(filename: filename) { dictionary in
            guard let data = dictionary["data"] as? [String: AnyObject] else {
                Logger.DLog(message: "failed unwrapping")
                return
            }

            guard let itemModelDetails = ItemDetailsModel(with: data) else {
                Logger.DLog(message: "failed unwrapping")
                return
            }

            self.delegate?.downloadedItemDetails(itemModelDetails)
        }
    }

    private func request(filename: String, completionBlock:@escaping ([String: AnyObject]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if let dictionary = JSONParser.jsonFromFilename(filename) {
                completionBlock(dictionary)
            } else {
                completionBlock([:])
            }
        }
    }
}
