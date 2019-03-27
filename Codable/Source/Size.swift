//
//  Size.swift
//  Codable
//
//  Created by Nate Walczak on 9/27/18.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

import Foundation

class Size: Codable {
    
    var width: Int
    var height: Int
    
    init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }
    
    required init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        
        self.width = try container.decode(Int.self)
        self.height = try container.decode(Int.self)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        
        try container.encode(width)
        try container.encode(height)
    }
    
}
