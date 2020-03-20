//
//  NilOnEmpty.swift
//  Codable
//
//  Created by Nate Walczak on 3/20/20.
//  Copyright © 2020 Detroit Labs. All rights reserved.
//

import Foundation

/// `Decodable` wrapper for types which may be represented as an empty
/// object (`{}`) in responses. Returns `nil` when an empty object is detected,
/// otherwise defaults to `T`'s `Decodable` implementation.
struct NilOnEmpty<T: Decodable>: Decodable {
    
    let value: T?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RawCodingKeys.self)
        guard !container.allKeys.isEmpty else {
            value = nil
            return
        }
        value = try T(from: decoder)
    }
    
}
