//
//  InconvenientArray.swift
//  Codable
//
//  Created by Nate Walczak on 9/27/18.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

import Foundation

class InconvenientArray: Decodable {
    
    let elements: [String]
    
    enum CodingKeys: String, CaseIterable, CodingKey {
        case item0 = "item.0"
        case item1 = "item.1"
        case item2 = "item.2"
        case item3 = "item.3"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        var elements: [String] = []
        
        for item in CodingKeys.allCases {
            guard container.contains(item) else {
                break
            }
            elements.append(try container.decode(String.self, forKey: item))
        }
        
        self.elements = elements
    }
    
}
