//
//  TableViewController.swift
//  UKiOSTest
//
//  Created by Paweł Sporysz on 15.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    private let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            if let indexPath = tableView.indexPathForSelectedRow,
                let detailController = segue.destination as? DetailsViewController {
                detailController.itemModel = itemModels[indexPath.row]
            }
        }
    }

    // MARK: - UITableViewController methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemModels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        let itemModel = itemModels[indexPath.row]
        cell.backgroundColor = itemModel.color
        cell.textLabel?.text = itemModel.name
        return cell
    }
}

extension TableViewController: NetworkingManagerDelegate {
    func downloadedItems(_ items: [ItemModel]) {
        self.itemModels = items
        self.tableView.reloadData()

        self.tabBarController?.view.isUserInteractionEnabled = true
        activityIndicator.removeFromSuperview()
    }

    func downloadedItemDetails(_ itemDetails: ItemDetailsModel) {

    }
}
