//
//  Invoice.swift
//  Codable
//
//  Created by Nate Walczak on 9/29/18.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

import Foundation

class Invoice: Codable {
    
    var shippingAddress: Address?
    var billingAddress: Address?
    
    var items: [Item]
    
    init(shippingAddress: Address? = nil, billingAddress: Address? = nil, items: [Item] = []) {
        self.shippingAddress = shippingAddress
        self.billingAddress = billingAddress
        self.items = items
    }
    
    enum CodingKeys: String, CodingKey {
        case shippingAddress = "shipping-address"
        case billingAddress = "billing-address"
        case items
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.shippingAddress = try container.decodeIfPresent(Address.self, forKey: .shippingAddress)
        self.billingAddress = try container.decodeIfPresent(Address.self, forKey: .billingAddress)
        
        let includeItems = decoder.userInfo[.includeInvoiceItems] as? Bool ?? true
        if includeItems {
            self.items = try container.decodeIfPresent([Item].self, forKey: .items) ?? []
        } else {
            self.items = []
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(shippingAddress, forKey: .shippingAddress)
        try container.encodeIfPresent(billingAddress, forKey: .billingAddress)
        
        let includeItems = encoder.userInfo[.includeInvoiceItems] as? Bool ?? true
        if includeItems && !items.isEmpty {
            try container.encode(items, forKey: .items)
        }
    }
    
}

extension CodingUserInfoKey {
    static let includeInvoiceItems = CodingUserInfoKey(rawValue: "include-invoice-items")!
}
