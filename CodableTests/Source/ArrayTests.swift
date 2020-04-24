//
//  ArrayTests.swift
//  CodableTests
//
//  Created by Nate Walczak on 9/27/18.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

import XCTest
@testable import Codable

class ArrayTests: XCTestCase {
    
    func testStrings() {
        // Given
        let json = Data("""
          ["Red", "Green", "Blue"]
        """.utf8)
        
        // When
        let strings: [String]
        do {
            strings = try JSONDecoder().decode([String].self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertEqual(strings, ["Red", "Green", "Blue"])
    }
    
    func testIntegers() {
        // Given
        let json = Data("""
          [1, 3, 5, 7, 9]
        """.utf8)
        
        // When
        let integers: [Int]
        do {
            integers = try JSONDecoder().decode([Int].self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertEqual(integers, [1, 3, 5, 7, 9])
    }
    
    func testBooleans() {
        // Given
        let json = Data("""
          [true, true, false]
        """.utf8)
        
        // When
        let booleans: [Bool]
        do {
            booleans = try JSONDecoder().decode([Bool].self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertEqual(booleans, [true, true, false])
    }
    
}
