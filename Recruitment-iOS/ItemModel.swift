//
//  ItemModel.swift
//  UKiOSTest
//
//  Created by Paweł Sporysz on 15.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit

class ItemModel {
    let idx: String
    let name: String

    private let _color: String
    var color: UIColor {
        return uiColor(from: _color)
    }

    init?(with data: [String: AnyObject]) {
        guard let idx = data["id"] as? String,
            let attributes = data["attributes"] as? [String: AnyObject],
            let name = attributes["name"] as? String,
            let color = attributes["color"] as? String else {
                Logger.DLog(message: "failed unwrapping")
                return nil
        }
        self.idx = idx
        self.name = name
        self._color = color
    }

    private func uiColor(from colorString: String) -> UIColor {
        var color: UIColor

        switch colorString {
        case "Red": color = UIColor.red
        case "Green": color = UIColor.green
        case "Blue": color = UIColor.blue
        case "Yellow": color = UIColor.yellow
        case "Purple": color = UIColor.purple
        default: color = UIColor.black
        }

        return color
    }
}
