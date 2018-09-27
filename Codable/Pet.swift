//
//  Pet.swift
//  Codable
//
//  Created by Nate Walczak on 9/27/18.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

import Foundation

class Pet: Codable {
    
    var name: String
    var kind: Kind
    var age: Int
    var isFriendly: Bool
    
    init(name: String, kind: Kind, age: Int, isFriendly: Bool) {
        self.name = name
        self.kind = kind
        self.age = age
        self.isFriendly = isFriendly
    }
    
}

extension Pet {
    
    enum Kind: String, Codable {
        case cat
        case dog
    }
    
}
