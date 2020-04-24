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
        let json = Data("""
          {
            "name": "Gizmo",
            "kind": "dog",
            "age": 14,
            "isFriendly": true
          }
        """.utf8)
        
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
    
    func testArrayDecodable() throws {
        // Given
        let json = Data("""
          [
            { "name": "Gizmo", "kind": "dog", "age": 14, "isFriendly": true },
            { "name": "Mr. White", "kind": "cat", "age": 3, "isFriendly": false }
          ]
        """.utf8)
        
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
        
        let firstPet = try XCTUnwrap(pets.first)
        XCTAssertEqual(firstPet.name, "Gizmo")
        XCTAssertEqual(firstPet.kind, .dog)
        XCTAssertEqual(firstPet.age, 14)
        XCTAssertEqual(firstPet.isFriendly, true)
        
        let secondPet = try XCTUnwrap(pets.second)
        XCTAssertEqual(secondPet.name, "Mr. White")
        XCTAssertEqual(secondPet.kind, .cat)
        XCTAssertEqual(secondPet.age, 3)
        XCTAssertEqual(secondPet.isFriendly, false)
    }
    
    func testEmptyArrayDecodable() {
        // Given
        let json = Data("""
          [
          ]
        """.utf8)
        
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
