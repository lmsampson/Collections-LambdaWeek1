//
//  ItemController.swift
//  Collections2
//
//  Created by Lisa Sampson on 7/30/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import Foundation

class ItemController {
    
    func createNewItem(withName name: String, value: String, location: String, isFavorite: Bool) -> Item {
        let item = Item(name: name, value: value, location: location, isFavorite: isFavorite)
        if isFavorite == true {
            items.insert(item, at: 0)
        } else {
            items.append(item)
        }
        return item
    }
    
    func updateItem(item: Item, withName name: String, value: String, location: String, isFavorite: Bool) {
        guard let index = items.index(of: item) else { return }
        
        var scratch = item
        scratch.name = name
        scratch.value = value
        scratch.location = location
        scratch.isFavorite = isFavorite
        
        items.remove(at: index)
        if isFavorite == true {
            items.insert(scratch, at: 0)
        } else {
            items.append(scratch)
        }
    }
    
    func delete(item:Item) {
        
        if let index = items.index(of: item) {
            items.remove(at: index)
        }
    }
    
    var items: [Item] = []
}
