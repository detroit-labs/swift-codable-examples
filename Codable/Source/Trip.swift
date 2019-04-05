//
//  Trip.swift
//  Codable
//
//  Created by Nate Walczak on 3/27/19.
//  Copyright © 2019 Detroit Labs. All rights reserved.
//

import Foundation

class Trip: Codable {
    
    var origin: String?
    var departure: Date?
    
    var destination: String?
    var arrival: Date?
    
}
