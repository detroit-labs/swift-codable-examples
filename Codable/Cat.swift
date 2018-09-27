//
//  Cat.swift
//  Codable
//
//  Created by Nate Walczak on 10/2/18.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

import Foundation

class Cat: Animal {
    
    var lenghtOfTail: Int?
    
    override init() {
        super.init()
    }
    
    enum CodingKeys: CodingKey {
        case lenghtOfTail
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.lenghtOfTail = try container.decodeIfPresent(Int.self, forKey: .lenghtOfTail)
        
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(lenghtOfTail, forKey: .lenghtOfTail)
        
        try super.encode(to: encoder)
    }
    
}
