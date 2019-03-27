//
//  Contact.swift
//  Codable
//
//  Created by Nate Walczak on 9/27/18.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

import Foundation

class Contact: Codable {
    
    var firstName: String?
    var lastName: String?
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first-name"
        case lastName = "last-name"
    }
    
}
