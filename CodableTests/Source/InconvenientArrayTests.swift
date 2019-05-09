//
//  InconvenientArrayTests.swift
//  CodableTests
//
//  Created by Nate Walczak on 9/27/18.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

import XCTest
@testable import Codable

class InconvenientArrayTests: XCTestCase {
    
    func testDecodable() {
        // Given
        let json = """
          {
            "item.3": "Delta",
            "item.0": "Alfa",
            "item.2": "Charlie",
            "item.1": "Bravo"
          }
        """.data(using: .utf8)!
        
        // When
        let inconvenientArray: InconvenientArray
        do {
            inconvenientArray = try JSONDecoder().decode(InconvenientArray.self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        let elements = inconvenientArray.elements
        
        // Then
        XCTAssertEqual(elements.count, 4)
        
        XCTAssertEqual(elements, ["Alfa", "Bravo", "Charlie", "Delta"])
    }
    
    func testTwoItemDecodable() {
        // Given
        let json = """
          {
            "item.0": "Alfa",
            "item.1": "Bravo"
          }
        """.data(using: .utf8)!
        
        // When
        let inconvenientArray: InconvenientArray
        do {
            inconvenientArray = try JSONDecoder().decode(InconvenientArray.self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        let elements = inconvenientArray.elements
        
        // Then
        XCTAssertEqual(elements.count, 2)
        
        XCTAssertEqual(elements, ["Alfa", "Bravo"])
    }
    
    func testEmptyDictionaryDecodable() {
        // Given
        let json = """
          {
          }
        """.data(using: .utf8)!
        
        // When
        let inconvenientArray: InconvenientArray
        do {
            inconvenientArray = try JSONDecoder().decode(InconvenientArray.self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        let elements = inconvenientArray.elements
        
        // Then
        XCTAssertEqual(elements.count, 0)
    }
    
}
