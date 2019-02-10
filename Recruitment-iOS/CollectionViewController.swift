//
//  CollectionViewController.swift
//  Recruitment-iOS
//
//  Created by Krzysztof Niestrój on 10/02/2019.
//  Copyright © 2019 Untitled Kingdom. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    private let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    private let sectionInsets = UIEdgeInsets(top: 20.0,
                                             left: 20.0,
                                             bottom: 20.0,
                                             right: 20.0)
    var itemModels: [ItemModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        activityIndicator.center = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY)
        self.view.addSubview(activityIndicator)
        self.tabBarController?.view.isUserInteractionEnabled = false
        activityIndicator.startAnimating()

        NetworkingManager.sharedManager.delegate = self
        NetworkingManager.sharedManager.downloadItems()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemModels.count
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellID",
                                                            for: indexPath) as? CollectionViewCell else {
            Logger.DLog(message: "failed casting to CollectionViewCell")
            return UICollectionViewCell()
        }

        let itemModel = itemModels[indexPath.row]
        cell.backgroundColor = itemModel.color
        cell.title.text = itemModel.name
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        return cell
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 2
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow

        return CGSize(width: widthPerItem, height: widthPerItem)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}

extension CollectionViewController: NetworkingManagerDelegate {
    func downloadedItems(_ items: [ItemModel]) {
        self.itemModels = items
        self.collectionView?.reloadData()

        self.tabBarController?.view.isUserInteractionEnabled = true
        activityIndicator.removeFromSuperview()
    }

    func downloadedItemDetails(_ itemDetails: ItemDetailsModel) {

    }
}
