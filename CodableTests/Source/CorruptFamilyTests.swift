//
//  CorruptFamilyTests.swift
//  CodableTests
//
//  Created by Nate Walczak on 3/20/20.
//  Copyright © 2020 Detroit Labs. All rights reserved.
//

import XCTest
@testable import Codable

class CorruptFamilyTests: XCTestCase {
    
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
        let corruptFamily: CorruptFamily
        do {
            corruptFamily = try JSONDecoder().decode(CorruptFamily.self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertNotNil(corruptFamily.mother?.value)
        XCTAssertNotNil(corruptFamily.father?.value)
        XCTAssertNil(corruptFamily.brother?.value)
        XCTAssertNil(corruptFamily.sister?.value)
        
        // When
        let family = corruptFamily.family
        
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
