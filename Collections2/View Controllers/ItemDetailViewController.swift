//
//  ItemDetailViewController.swift
//  Collections2
//
//  Created by Lisa Sampson on 7/30/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonWasPressed(_ sender: Any) {
        guard let name = itemNameTextField.text,
            let value = itemValueTextField.text,
            let location = itemLocationTextField.text else { return }
        
        if let item = item {
            itemController?.updateItem(item: item, withName: name, value: value, location: location)
        } else {
            let _ = itemController?.createNewItem(withName: name, value: value, location: location)
        }
    }
    
    private func updateViews() {
        guard let item = item else {
            title = "New Item"
            return
        }
        
        title = item.name
        
        itemNameTextField.text = item.name
        itemValueTextField.text = item.value
        itemLocationTextField.text = item.location
    }
    
    var item: Item?
    var itemController: ItemController?
    
    @IBOutlet weak var itemNameTextField: UITextField!
    @IBOutlet weak var itemValueTextField: UITextField!
    @IBOutlet weak var itemLocationTextField: UITextField!
    
}
