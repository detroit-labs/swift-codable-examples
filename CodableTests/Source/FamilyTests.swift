//
//  FamilyTests.swift
//  CodableTests
//
//  Created by Nate Walczak on 3/20/20.
//  Copyright © 2020 Detroit Labs. All rights reserved.
//

import XCTest
@testable import Codable

class FamilyTests: XCTestCase {
    
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
        let family: Family
        do {
            family = try JSONDecoder().decode(Family.self, from: json)
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
        
        let brother = try XCTUnwrap(family.brother)
        XCTAssertNil(brother.firstName)
        XCTAssertNil(brother.lastName)

        XCTAssertNil(family.sister)
    }
    
}
