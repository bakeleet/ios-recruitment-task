//
//  TableViewController.swift
//  UKiOSTest
//
//  Created by Paweł Sporysz on 15.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, NetworkingManagerDelegate {
    var itemModels: [ItemModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
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

    // MARK: - NetworkingManagerDelegate methods

    func downloadedItems(_ items: [ItemModel]) {
        self.itemModels = items
        self.tableView.reloadData()
    }

    func downloadedItemDetails(_ itemDetails: ItemDetailsModel) {

    }
}
