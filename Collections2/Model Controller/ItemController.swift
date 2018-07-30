//
//  ItemController.swift
//  Collections2
//
//  Created by Lisa Sampson on 7/30/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import Foundation

class ItemController {
    
    func createNewItem(withName name: String, value: String, location: String) -> Item {
        let item = Item(name: name, value: value, location: location)
        items.append(item)
        return item
    }
    
    func updateItem(item: Item, withName name: String, value: String, location: String) {
        guard let index = items.index(of: item) else { return }
        
        var scratch = item
        scratch.name = name
        scratch.value = value
        scratch.location = location
        
        items.remove(at: index)
        items.insert(scratch, at: index)
    }
    
    var items: [Item] = []
}
