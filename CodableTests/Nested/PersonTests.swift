//
//  PersonTests.swift
//  CodableTests
//
//  Created by Nate Walczak on 10/5/18.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

import XCTest
@testable import Codable

class PersonTests: XCTestCase {
    
    func testDecodable() {
        // Given
        let json = """
          {
            "age": 45,
            "name": {
              "first": "Steve",
              "last": "Dave"
            }
          }
        """.data(using: .utf8)!
        
        // When
        let person: Person
        do {
            person = try JSONDecoder().decode(Person.self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertEqual(person.age, 45)
        XCTAssertEqual(person.first, "Steve")
        XCTAssertEqual(person.last, "Dave")
    }
    
    func testEncodable() {
        // Given
        let person = Person()
        person.age = 23
        person.first = "Robert"
        person.last = "Webster"
        
        // When
        let data: Data
        let json: [String: Any]?
        do {
            data = try JSONEncoder().encode(person)
            json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        let name = json?["name"] as? [String: Any]
        
        // Then
        XCTAssertNotNil(json)
        XCTAssertEqual(json?.count, 2)
        
        XCTAssertEqual(json?["age"] as? Int, 23)
        
        XCTAssertNotNil(name)
        XCTAssertEqual(name?.count, 2)
        
        XCTAssertEqual(name?["first"] as? String, "Robert")
        XCTAssertEqual(name?["last"] as? String, "Webster")
    }
    
    func testOptionalEncodable() {
        // Given
        let person = Person()
        
        // When
        let data: Data
        let json: [String: Any]?
        do {
            data = try JSONEncoder().encode(person)
            json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        let name = json?["name"] as? [String: Any]
        
        // Then
        XCTAssertNotNil(json)
        XCTAssertEqual(json?.count, 1)
        
        XCTAssertNotNil(name)
        XCTAssertEqual(name?.count, 0)
    }
    
}
