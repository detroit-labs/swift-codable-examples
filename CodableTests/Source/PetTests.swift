//
//  PetTests.swift
//  CodableTests
//
//  Created by Nate Walczak on 9/27/18.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

import XCTest
@testable import Codable

class PetTests: XCTestCase {
    
    func testDecodable() {
        // Given
        let json = """
          {
            "name": "Gizmo",
            "kind": "dog",
            "age": 14,
            "isFriendly": true
          }
        """.data(using: .utf8)!
        
        // When
        let pet: Pet
        do {
            pet = try JSONDecoder().decode(Pet.self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertEqual(pet.name, "Gizmo")
        XCTAssertEqual(pet.kind, .dog)
        XCTAssertEqual(pet.age, 14)
        XCTAssertEqual(pet.isFriendly, true)
    }
    
    func testArrayDecodable() {
        // Given
        let json = """
          [
            { "name": "Gizmo", "kind": "dog", "age": 14, "isFriendly": true },
            { "name": "Mr. White", "kind": "cat", "age": 3, "isFriendly": false }
          ]
        """.data(using: .utf8)!
        
        // When
        let pets: [Pet]
        do {
            pets = try JSONDecoder().decode([Pet].self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertEqual(pets.count, 2)
        
        XCTAssertEqual(pets.first?.name, "Gizmo")
        XCTAssertEqual(pets.first?.kind, .dog)
        XCTAssertEqual(pets.first?.age, 14)
        XCTAssertEqual(pets.first?.isFriendly, true)
        
        XCTAssertEqual(pets.second?.name, "Mr. White")
        XCTAssertEqual(pets.second?.kind, .cat)
        XCTAssertEqual(pets.second?.age, 3)
        XCTAssertEqual(pets.second?.isFriendly, false)
    }
    
    func testEmptyArrayDecodable() {
        // Given
        let json = """
          [
          ]
        """.data(using: .utf8)!
        
        // When
        let pets: [Pet]
        do {
            pets = try JSONDecoder().decode([Pet].self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertEqual(pets.count, 0)
    }
    
    func testEncodable() {
        // Given
        let pet = Pet(name: "Gizmo", kind: .dog, age: 14, isFriendly: true)
        
        // When
        let data: Data
        let json: [String: Any]?
        do {
            data = try JSONEncoder().encode(pet)
            json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertNotNil(json)
        XCTAssertEqual(json?.count, 4)
        
        XCTAssertEqual(json?["name"] as? String, "Gizmo")
        XCTAssertEqual(json?["kind"] as? String, "dog")
        XCTAssertEqual(json?["age"] as? Int, 14)
        XCTAssertEqual(json?["isFriendly"] as? Bool, true)
    }
    
}
