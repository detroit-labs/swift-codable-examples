//
//  AnotherFamily.swift
//  Codable
//
//  Created by Nate Walczak on 3/20/20.
//  Copyright © 2020 Detroit Labs. All rights reserved.
//

import Foundation

class AnotherFamily: Codable {
    
    var mother: Contact?
    var father: Contact?
    var brother: Contact?
    var sister: Contact?
    
    init() {
    }
    
    enum CodingKeys: CodingKey {
        case mother
        case father
        case brother
        case sister
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.mother = try container.decodeIfPresent(NilOnEmpty<Contact>.self, forKey: .mother)?.value
        self.father = try container.decodeIfPresent(NilOnEmpty<Contact>.self, forKey: .father)?.value
        self.brother = try container.decodeIfPresent(NilOnEmpty<Contact>.self, forKey: .brother)?.value
        self.sister = try container.decodeIfPresent(NilOnEmpty<Contact>.self, forKey: .sister)?.value
    }
    
}
