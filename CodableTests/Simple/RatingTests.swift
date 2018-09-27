//
//  RatingTests.swift
//  CodableTests
//
//  Created by Nate Walczak on 9/27/18.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

import XCTest
@testable import Codable

class RatingTests: XCTestCase {
    
    func testAllCases() {
        // Given
        let allCases = Rating.allCases
        
        // Then
        XCTAssertEqual(allCases, [.oneStar, .twoStars, .threeStars, .fourStars, .fiveStars])
    }
    
    func testRawValues() {
        XCTAssertEqual(Rating.oneStar.rawValue, "*")
        XCTAssertEqual(Rating.twoStars.rawValue, "**")
        XCTAssertEqual(Rating.threeStars.rawValue, "***")
        XCTAssertEqual(Rating.fourStars.rawValue, "****")
        XCTAssertEqual(Rating.fiveStars.rawValue, "*****")
    }
    
    func testDecodable() {
        // Given
        let json = """
          [
            "*",
            "**",
            "***",
            "****",
            "*****"
          ]
        """.data(using: .utf8)!
        
        // When
        let ratings: [Rating]
        do {
            ratings = try JSONDecoder().decode([Rating].self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertEqual(ratings, [.oneStar, .twoStars, .threeStars, .fourStars, .fiveStars])
    }
    
}
