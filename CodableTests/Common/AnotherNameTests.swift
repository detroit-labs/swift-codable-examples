//
//  AnotherNameTests.swift
//  CodableTests
//
//  Created by Nate Walczak on 9/27/18.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

import XCTest
@testable import Codable

class AnotherNameTests: XCTestCase {
    
    func testDecodable() {
        // Given
        let json = """
          {
            "first": "Steve",
            "last": "Dave"
          }
        """.data(using: .utf8)!
        
        // When
        let name: AnotherName
        do {
            name = try JSONDecoder().decode(AnotherName.self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertEqual(name.first, "Steve")
        XCTAssertEqual(name.last, "Dave")
    }
    
    func testArrayDecodable() {
        // Given
        let json = """
          [
            { "first": "Gwen", "last": "Stacy" },
            { "first": "John", "last": "Doe" }
          ]
        """.data(using: .utf8)!
        
        // When
        let names: [AnotherName]
        do {
            names = try JSONDecoder().decode([AnotherName].self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertEqual(names.count, 2)
        
        XCTAssertEqual(names.first?.first, "Gwen")
        XCTAssertEqual(names.first?.last, "Stacy")
        
        XCTAssertEqual(names.second?.first, "John")
        XCTAssertEqual(names.second?.last, "Doe")
    }
    
    func testEmptyArrayDecodable() {
        // Given
        let json = """
          [
          ]
        """.data(using: .utf8)!
        
        // When
        let names: [AnotherName]
        do {
            names = try JSONDecoder().decode([AnotherName].self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertEqual(names.count, 0)
    }
    
    func testEncodable() {
        // Given
        let name = AnotherName()
        name.first = "Robert"
        name.last = "Webster"
        
        // When
        let data: Data
        let json: [String: Any]?
        do {
            data = try JSONEncoder().encode(name)
            json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertNotNil(json)
        XCTAssertEqual(json?.count, 2)
        
        XCTAssertEqual(json?["first"] as? String, "Robert")
        XCTAssertEqual(json?["last"] as? String, "Webster")
    }
    
    func testOptionalEncodable() {
        // Given
        let name = AnotherName()
        name.last = "Dynamite"
        
        // When
        let data: Data
        let json: [String: Any]?
        do {
            data = try JSONEncoder().encode(name)
            json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertNotNil(json)
        XCTAssertEqual(json?.count, 1)
        
        XCTAssertEqual(json?["last"] as? String, "Dynamite")
    }
    
}
