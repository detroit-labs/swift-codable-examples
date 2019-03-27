//
//  DogTests.swift
//  CodableTests
//
//  Created by Nate Walczak on 10/2/18.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

import XCTest
@testable import Codable

class DogTests: XCTestCase {
    
    func testDecodable() {
        // Given
        let json = """
          {
            "name": "Skippy",
            "numberOfBones": 1
          }
        """.data(using: .utf8)!
        
        // When
        let dog: Dog
        do {
            dog = try JSONDecoder().decode(Dog.self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertEqual(dog.name, "Skippy")
        XCTAssertEqual(dog.numberOfBones, 1)
    }
    
    func testEncodable() {
        // Given
        let dog = Dog()
        dog.name = "Max"
        dog.numberOfBones = 3
        
        // When
        let data: Data
        let json: [String: Any]?
        do {
            data = try JSONEncoder().encode(dog)
            json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertNotNil(json)
        XCTAssertEqual(json?.count, 2)
        
        XCTAssertEqual(json?["name"] as? String, "Max")
        XCTAssertEqual(json?["numberOfBones"] as? Int, 3)
    }
    
}
