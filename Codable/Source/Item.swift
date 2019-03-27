//
//  Item.swift
//  Codable
//
//  Created by Nate Walczak on 9/29/18.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

import Foundation

class Item: Codable {
    
    var sku: String
    var name: String
    var quantity: Int
    
    init(sku: String, name: String, quantity: Int) {
        self.sku = sku
        self.name = name
        self.quantity = quantity
    }
    
}
