//
//  CorruptFamily.swift
//  Codable
//
//  Created by Nate Walczak on 3/20/20.
//  Copyright © 2020 Detroit Labs. All rights reserved.
//

import Foundation

class CorruptFamily: Decodable {
    
    var mother: NilOnEmpty<Contact>?
    var father: NilOnEmpty<Contact>?
    var brother: NilOnEmpty<Contact>?
    var sister: NilOnEmpty<Contact>?
    
    var family: Family {
        let family = Family()
        family.mother = mother?.value
        family.father = father?.value
        family.brother = brother?.value
        family.sister = sister?.value
        return family
    }
    
}
