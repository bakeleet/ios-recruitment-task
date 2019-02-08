//
//  ItemDetailsModel.swift
//  UKiOSTest
//
//  Created by Paweł Sporysz on 15.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit

class ItemDetailsModel: ItemModel {
    let desc: String

    override init?(with data: [String : AnyObject]) {
        guard let attributes = data["attributes"] as? [String : AnyObject],
            let desc = attributes["desc"] as? String else {
                Logger.DLog(message: "failed unwrapping")
                return nil
        }

        self.desc = desc
        super.init(with: data)
    }
}
