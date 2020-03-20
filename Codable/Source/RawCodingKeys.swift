//
//  RawCodingKeys.swift
//  Codable
//
//  Created by Nate Walczak on 3/20/20.
//  Copyright © 2020 Detroit Labs. All rights reserved.
//

import Foundation

/// Type which captures the raw value of each key in a `Codable` container.
struct RawCodingKeys: CodingKey {
    
    var stringValue: String
    
    init(stringValue: String) {
        self.stringValue = stringValue
    }
    
    var intValue: Int?
    
    init?(intValue: Int) {
        self.init(stringValue: "\(intValue)")
        self.intValue = intValue
    }
    
}
