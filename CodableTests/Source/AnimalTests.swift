//
//  AnimalTests.swift
//  CodableTests
//
//  Created by Nate Walczak on 10/2/18.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

import XCTest
@testable import Codable

class AnimalTests: XCTestCase {
    
    func testDecodable() {
        // Given
        let json = """
          {
            "name": "Little Moo"
          }
        """.data(using: .utf8)!
        
        // When
        let animal: Animal
        do {
            animal = try JSONDecoder().decode(Animal.self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertEqual(animal.name, "Little Moo")
    }
    
    func testEncodable() {
        // Given
        let animal = Animal()
        animal.name = "Little Moo"
        
        // When
        let data: Data
        let json: [String: Any]?
        do {
            data = try JSONEncoder().encode(animal)
            json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertNotNil(json)
        XCTAssertEqual(json?.count, 1)
        
        XCTAssertEqual(json?["name"] as? String, "Little Moo")
    }
    
}
