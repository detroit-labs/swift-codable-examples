//
//  BuildingTests.swift
//  CodableTests
//
//  Created by Nate Walczak on 4/7/20.
//  Copyright © 2020 Detroit Labs. All rights reserved.
//

import XCTest
@testable import Codable

class BuildingTests: XCTestCase {
    
    func testDecodable() {
        // Given
        let json = Data("""
          {
            "name": "Office Space",
            "address": "123 Main St"
          }
        """.utf8)
        
        // When
        let building: Building
        do {
            building = try JSONDecoder().decode(Building.self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertEqual(building.name, "Office Space")
        XCTAssertEqual(building.address, "123 Main St")
    }
    
    func testOptionalDecodable() {
        // Given
        let json = Data("""
          {
            "name": "Office Space"
          }
        """.utf8)
        
        // When
        let building: Building
        do {
            building = try JSONDecoder().decode(Building.self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertEqual(building.name, "Office Space")
        XCTAssertNil(building.address)
    }
    
}
