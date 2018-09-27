//
//  Dog.swift
//  Codable
//
//  Created by Nate Walczak on 10/2/18.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

import Foundation

class Dog: Animal {
    
    var numberOfBones: Int?
    
    override init() {
        super.init()
    }
    
    enum CodingKeys: CodingKey {
        case numberOfBones
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.numberOfBones = try container.decodeIfPresent(Int.self, forKey: .numberOfBones)
        
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(numberOfBones, forKey: .numberOfBones)
        
        try super.encode(to: encoder)
    }
}
