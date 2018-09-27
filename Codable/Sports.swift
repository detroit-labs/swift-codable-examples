//
//  Sports.swift
//  Codable
//
//  Created by Nate Walczak on 9/27/18.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

import Foundation

struct Sports: OptionSet, CaseIterable, Codable {
    
    let rawValue: Int
    
    init(rawValue: RawValue) {
        self.rawValue = rawValue
    }
    
    static let running = Sports(rawValue: 1 << 0)
    static let cycling = Sports(rawValue: 1 << 1)
    static let fencing = Sports(rawValue: 1 << 2)
    static let swimming = Sports(rawValue: 1 << 3)
    
    static let allCases: [Sports] = [.running, .cycling, .fencing, .swimming]
    
    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        
        var sports: Sports = []
        
        while !container.isAtEnd {
            let sport = try container.decode(Sport.self)
            let index = Sport.allCases.firstIndex(of: sport)!
            sports.insert(Sports.allCases[index])
        }
        
        self = sports
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        
        for (index, element) in Sports.allCases.enumerated() {
            if self.contains(element) {
                let sport = Sport.allCases[index]
                try container.encode(sport)
            }
        }
    }
    
}

extension Sports {
    
    enum Sport: String, CaseIterable, Codable {
        case running
        case cycling
        case fencing
        case swimming
    }
    
}
