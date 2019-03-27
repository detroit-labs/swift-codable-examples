//
//  SportsTests.swift
//  CodableTests
//
//  Created by Nate Walczak on 9/27/18.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

import XCTest
@testable import Codable

class SportsTests: XCTestCase {
    
    func testAllCases() {
        // Given
        let allCases = Sports.allCases
        
        // Then
        XCTAssertEqual(allCases, [.running, .cycling, .fencing, .swimming])
    }
    
    func testRawValues() {
        XCTAssertEqual(Sports.running.rawValue, 1)
        XCTAssertEqual(Sports.cycling.rawValue, 2)
        XCTAssertEqual(Sports.fencing.rawValue, 4)
        XCTAssertEqual(Sports.swimming.rawValue, 8)
    }
    
    func testDecodable() {
        // Given
        let json = """
          [
            "swimming",
            "running"
          ]
        """.data(using: .utf8)!
        
        // When
        let sports: Sports
        do {
            sports = try JSONDecoder().decode(Sports.self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertTrue(sports.contains(.running))
        XCTAssertTrue(sports.contains(.swimming))
        
        XCTAssertEqual(sports, [.running, .swimming])
    }
    
    func testEncodable() {
        // Given
        let sports: Sports = [.running, .fencing, .cycling]
        
        // When
        let data: Data
        let json: [Any]?
        do {
            data = try JSONEncoder().encode(sports)
            json = try JSONSerialization.jsonObject(with: data, options: []) as? [Any]
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertNotNil(json)
        XCTAssertEqual(json?.count, 3)
        
        XCTAssertEqual(json as? [String], ["running", "cycling", "fencing"])
    }
    
}
