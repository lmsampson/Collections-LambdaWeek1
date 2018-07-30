//
//  CollectionTableViewController.swift
//  Collections2
//
//  Created by Lisa Sampson on 7/30/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import UIKit

class CollectionTableViewController: UITableViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemController.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)

        let item = itemController.items[indexPath.row]
        cell.textLabel?.text = item.name

        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItemSegue" {
            guard let detailVC = segue.destination as? ItemDetailViewController else { return }
            detailVC.itemController = itemController
            
        } else if segue.identifier == "EditItemSegue" {
            guard let detailVC = segue.destination as? ItemDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow else { return }
            detailVC.itemController = itemController
            detailVC.item = itemController.items[indexPath.row]
        }
    }


    let itemController = ItemController()
    
}
