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
    
    func testDecodable() {
        // Given
        let json = """
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
        """.data(using: .utf8)!
        
        // When
        let family: Family
        do {
            family = try JSONDecoder().decode(Family.self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertEqual(family.mother?.firstName, "Anne")
        XCTAssertEqual(family.mother?.lastName, "Dave")
        
        XCTAssertEqual(family.father?.firstName, "Steve")
        XCTAssertEqual(family.father?.lastName, "Dave")
        
        XCTAssertNotNil(family.brother)
        XCTAssertNil(family.brother?.firstName)
        XCTAssertNil(family.brother?.lastName)

        XCTAssertNil(family.sister)
    }
    
}
