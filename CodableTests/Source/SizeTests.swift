//
//  SizeTests.swift
//  CodableTests
//
//  Created by Nate Walczak on 9/27/18.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

import XCTest
@testable import Codable

class SizeTests: XCTestCase {
    
    func testDecodable() {
        // Given
        let json = """
          [ 16, 9 ]
        """.data(using: .utf8)!
        
        // When
        let size: Size
        do {
            size = try JSONDecoder().decode(Size.self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertEqual(size.width, 16)
        XCTAssertEqual(size.height, 9)
    }
    
    func testEncodable() {
        // Given
        let size = Size(width: 4, height: 3)
        
        // When
        let data: Data
        let json: [Any]?
        do {
            data = try JSONEncoder().encode(size)
            json = try JSONSerialization.jsonObject(with: data, options: []) as? [Any]
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertNotNil(json)
        XCTAssertEqual(json?.count, 2)
        
        XCTAssertEqual(json?.first as? Int, 4)
        XCTAssertEqual(json?.second as? Int, 3)
    }
    
}
