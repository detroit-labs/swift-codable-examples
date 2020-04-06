//
//  SafeDecodableTests.swift
//  CodableTests
//
//  Created by Nate Walczak on 4/6/20.
//  Copyright © 2020 Detroit Labs. All rights reserved.
//

import XCTest
@testable import Codable

class SafeDecodableTests: XCTestCase {
    
    func testValue() throws {
        // Given
        let json = """
          {
            "sku": "I001",
            "name": "Labs Beats V1",
            "quantity": 10000
          }
        """.data(using: .utf8)!
        
        // When
        let safeItem: SafeDecodable<Item>
        do {
            safeItem = try JSONDecoder().decode(SafeDecodable<Item>.self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertNil(safeItem.error)
        
        let item = try XCTUnwrap(safeItem.value)
        
        XCTAssertEqual(item.sku, "I001")
        XCTAssertEqual(item.name, "Labs Beats V1")
        XCTAssertEqual(item.quantity, 10_000)
    }
    
    func testError() {
        // Given
        let json = """
          {
            "sku": "I001",
            "name": "Labs Beats V1"
          }
        """.data(using: .utf8)!
        
        // When
        let safeItem: SafeDecodable<Item>
        do {
            safeItem = try JSONDecoder().decode(SafeDecodable<Item>.self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertNil(safeItem.value)
        
        XCTAssertNotNil(safeItem.error)
    }
    
    func testValues() throws {
        // Given
        let json = """
          [
            {
              "sku": "I001",
              "name": "Labs Beats V1",
            },
            {
              "sku": "I002",
              "name": "Labs Beats V2",
              "quantity": 8
            },
            {
              "sku": "I003",
              "name": "Labs Beats V3",
            }
          ]
        """.data(using: .utf8)!
        
        // When
        let safeItems: [SafeDecodable<Item>]
        do {
            safeItems = try JSONDecoder().decode([SafeDecodable<Item>].self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        let items = safeItems.values()
        
        let firstItem = try XCTUnwrap(items.first)
        XCTAssertEqual(firstItem.sku, "I002")
        XCTAssertEqual(firstItem.name, "Labs Beats V2")
        XCTAssertEqual(firstItem.quantity, 8)
        
        let errors = safeItems.errors()
        XCTAssertEqual(errors.count, 2)
    }
    
}
