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
        var i = makeIterator()
        _ = i.next()
        return i.next()
    }
    
    var third: Element? {
        var i = makeIterator()
        _ = i.next()
        _ = i.next()
        return i.next()
    }
    
}
