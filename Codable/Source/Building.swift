//
//  Building.swift
//  Codable
//
//  Created by Nate Walczak on 4/7/20.
//  Copyright © 2020 Detroit Labs. All rights reserved.
//

import Foundation

struct Building: Codable {
    
    var name: String
    var address: String?
    
    enum CodingKeys: CodingKey {
        case name
        case address
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try container.decode(.name)
        self.address = try container.decodeIfPresent(.address)
    }
    
}
