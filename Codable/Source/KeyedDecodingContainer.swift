//
//  KeyedDecodingContainer.swift
//  Codable
//
//  Created by Nate Walczak on 4/7/20.
//  Copyright © 2020 Detroit Labs. All rights reserved.
//

import Foundation

extension KeyedDecodingContainer {
     
     func decode<T: Decodable>(_ key: Key) throws -> T {
          return try decode(T.self, forKey: key)
     }
     
     func decodeIfPresent<T: Decodable>(_ key: Key) throws -> T? {
          return try decodeIfPresent(T.self, forKey: key)
     }
     
}
