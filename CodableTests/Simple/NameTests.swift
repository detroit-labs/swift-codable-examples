//
//  NameTests.swift
//  CodableTests
//
//  Created by Nate Walczak on 9/27/18.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

import XCTest
@testable import Codable

class NameTests: XCTestCase {
    
    func testDecodable() {
        // Given
        let json = """
          {
            "first": "Steve",
            "last": "Dave"
          }
        """.data(using: .utf8)!
        
        // When
        let name: Name
        do {
            name = try JSONDecoder().decode(Name.self, from: json)
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
            { "first": "Betty", "last": "Brant" },
            { "first": "Mary Jane", "last": "Watson" }
          ]
        """.data(using: .utf8)!
        
        // When
        let names: [Name]
        do {
            names = try JSONDecoder().decode([Name].self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertEqual(names.count, 3)
        
        XCTAssertEqual(names.first?.first, "Gwen")
        XCTAssertEqual(names.first?.last, "Stacy")
        
        XCTAssertEqual(names.second?.first, "Betty")
        XCTAssertEqual(names.second?.last, "Brant")
        
        XCTAssertEqual(names.third?.first, "Mary Jane")
        XCTAssertEqual(names.third?.last, "Watson")
    }
    
    func testEmptyArrayDecodable() {
        // Given
        let json = """
          [
          ]
        """.data(using: .utf8)!
        
        // When
        let names: [Name]
        do {
            names = try JSONDecoder().decode([Name].self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertEqual(names.count, 0)
    }
    
    func testEncodable() {
        // Given
        let name = Name()
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
        let name = Name()
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
    
    func testPropertyListDecodable() {
        // Given
        let json = """
          <?xml version="1.0" encoding="UTF-8"?>
          <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
          <plist version="1.0">
          <dict>
            <key>first</key>
            <string>Steve</string>
            <key>last</key>
            <string>Dave</string>
          </dict>
          </plist>
        """.data(using: .utf8)!
        
        // When
        let name: Name
        do {
            name = try PropertyListDecoder().decode(Name.self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertEqual(name.first, "Steve")
        XCTAssertEqual(name.last, "Dave")
    }
    
}
