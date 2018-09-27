//
//  AnotherName.swift
//  Codable
//
//  Created by Nate Walczak on 9/29/18.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

import Foundation

class AnotherName: Codable {
    
    var first: String?
    var last: String?
    
    init() {
    }
    
    enum CodingKeys: CodingKey {
        case first
        case last
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.first = try container.decodeIfPresent(String.self, forKey: .first)
        self.last = try container.decodeIfPresent(String.self, forKey: .last)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(first, forKey: .first)
        try container.encodeIfPresent(last, forKey: .last)
    }
    
}
