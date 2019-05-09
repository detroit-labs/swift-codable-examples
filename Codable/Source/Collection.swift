//
//  Collection.swift
//  Codable
//
//  Created by Nate Walczak on 9/27/18.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

import Foundation

extension Collection {
    
    var second: Element? {
        var iterator = makeIterator()
        _ = iterator.next()
        return iterator.next()
    }
    
    var third: Element? {
        var iterator = makeIterator()
        _ = iterator.next()
        _ = iterator.next()
        return iterator.next()
    }
    
}
