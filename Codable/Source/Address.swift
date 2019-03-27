//
//  Address.swift
//  Codable
//
//  Created by Nate Walczak on 9/29/18.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

import Foundation

class Address: Codable {
    
    var name: String?
    var line1: String?
    var line2: String?
    var city: String?
    var state: String?
    var zipCode: String?
    
    init(name: String? = nil,
         line1: String? = nil,
         line2: String? = nil,
         city: String? = nil,
         state: String? = nil,
         zipCode: String? = nil) {
        self.name = name
        self.line1 = line1
        self.line2 = line2
        self.city = city
        self.state = state
        self.zipCode = zipCode
    }
    
}
