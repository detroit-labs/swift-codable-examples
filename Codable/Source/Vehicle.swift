//
//  Vehicle.swift
//  Codable
//
//  Created by Nathan Walczak on 6/14/21.
//  Copyright © 2021 Detroit Labs. All rights reserved.
//

import Foundation

enum Vehicle: Codable, Equatable {
    case bicycle
    case boat(floats: Bool)
    case car(year: Int, make: String, model: String)
    case limo(String, something: Bool, Int)
    case truck(wheels: Int)
    case van(contents: [String])
}
