//
//  CatTests.swift
//  CodableTests
//
//  Created by Nate Walczak on 10/2/18.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

import XCTest
@testable import Codable

class CatTests: XCTestCase {
    
    func testDecodable() {
        // Given
        let json = """
          {
            "name": "Fluffy",
            "lenghtOfTail": 6
          }
        """.data(using: .utf8)!
        
        // When
        let cat: Cat
        do {
            cat = try JSONDecoder().decode(Cat.self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertEqual(cat.name, "Fluffy")
        XCTAssertEqual(cat.lenghtOfTail, 6)
    }
    
    func testEncodable() {
        // Given
        let cat = Cat()
        cat.name = "Scaredy"
        cat.lenghtOfTail = 4
        
        // When
        let data: Data
        let json: [String: Any]?
        do {
            data = try JSONEncoder().encode(cat)
            json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertNotNil(json)
        XCTAssertEqual(json?.count, 2)
        
        XCTAssertEqual(json?["name"] as? String, "Scaredy")
        XCTAssertEqual(json?["lenghtOfTail"] as? Int, 4)
    }
    
}
