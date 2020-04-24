//
//  AnotherFamilyTests.swift
//  CodableTests
//
//  Created by Nate Walczak on 3/20/20.
//  Copyright © 2020 Detroit Labs. All rights reserved.
//

import XCTest
@testable import Codable

class AnotherFamilyTests: XCTestCase {
    
    func testDecodable() throws {
        // Given
        let json = Data("""
          {
            "mother": {
              "first-name": "Anne",
              "last-name": "Dave"
            },
            "father": {
              "first-name": "Steve",
              "last-name": "Dave"
            },
            "brother": {
            }
          }
        """.utf8)
        
        // When
        let family: AnotherFamily
        do {
            family = try JSONDecoder().decode(AnotherFamily.self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        let mother = try XCTUnwrap(family.mother)
        XCTAssertEqual(mother.firstName, "Anne")
        XCTAssertEqual(mother.lastName, "Dave")
        
        let father = try XCTUnwrap(family.father)
        XCTAssertEqual(father.firstName, "Steve")
        XCTAssertEqual(father.lastName, "Dave")
        
        XCTAssertNil(family.brother)
        
        XCTAssertNil(family.sister)
    }
    
}
