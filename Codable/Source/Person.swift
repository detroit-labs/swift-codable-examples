//
//  Person.swift
//  Codable
//
//  Created by Nate Walczak on 10/5/18.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

import Foundation

class Person: Codable {
    
    var age: Int?
    
    var first: String?
    var last: String?
    
    init() {
    }
    
    enum CodingKeys: CodingKey {
        case age
        case name
    }
    
    enum NameCodingKeys: CodingKey {
        case first
        case last
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.age = try container.decodeIfPresent(Int.self, forKey: .age)
        
        let nameContainer = try container.nestedContainer(keyedBy: NameCodingKeys.self, forKey: .name)
        
        self.first = try nameContainer.decodeIfPresent(String.self, forKey: .first)
        self.last = try nameContainer.decodeIfPresent(String.self, forKey: .last)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(age, forKey: .age)
        
        var nameContainer = container.nestedContainer(keyedBy: NameCodingKeys.self, forKey: .name)
        
        try nameContainer.encodeIfPresent(first, forKey: .first)
        try nameContainer.encodeIfPresent(last, forKey: .last)
    }
    
}
