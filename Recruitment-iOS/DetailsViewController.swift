//
//  DetailsViewController.swift
//  UKiOSTest
//
//  Created by Paweł Sporysz on 15.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, NetworkingManagerDelegate {
    @IBOutlet weak var textView: UITextView!

    var itemModel: ItemModel? {
        didSet {
            reloadData()
        }
    }

    private func reloadData() {
        guard let model = itemModel else {
            Logger.DLog(message: "itemModel is nil")
            return
        }

        // This chain below is certainly shorter than the for loop, but is it more readable?
        self.navigationItem.title = Array(model.name).enumerated().map { idx, letter in
                idx % 2 == 0 ? String(letter).uppercased() : String(letter).lowercased()
            }.joined()
        self.view.backgroundColor = model.color

        NetworkingManager.sharedManager.delegate = self
        NetworkingManager.sharedManager.downloadItemWithID(model.idx)
    }

    // MARK: - NetworkingManagerDelegate methods

    func downloadedItems(_ items: [ItemModel]) {

    }

    func downloadedItemDetails(_ itemDetails: ItemDetailsModel) {
        textView.text = itemDetails.desc
    }
}
