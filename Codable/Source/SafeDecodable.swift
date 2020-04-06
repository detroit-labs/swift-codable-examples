//
//  SafeDecodable.swift
//  Codable
//
//  Created by Nate Walczak on 4/3/20.
//  Copyright © 2020 Detroit Labs. All rights reserved.
//

import Foundation

struct SafeDecodable<Value: Decodable>: Decodable {
    
    var value: Value?
    var error: Error?
    
    init(from decoder: Decoder) throws {
        do {
            let container = try decoder.singleValueContainer()
            self.value = try container.decode(Value.self)
            self.error = nil
        } catch {
            self.value = nil
            self.error = error
        }
    }
    
}

extension Sequence {
    
    func values<T>() -> [T] where Element == SafeDecodable<T> {
        return compactMap { $0.value }
    }
    
    func errors<T>() -> [Error] where Element == SafeDecodable<T> {
        return compactMap { $0.error }
    }
    
}
