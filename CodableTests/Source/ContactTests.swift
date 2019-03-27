//
//  ContactTests.swift
//  CodableTests
//
//  Created by Nate Walczak on 9/27/18.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

import XCTest
@testable import Codable

class ContactTests: XCTestCase {
    
    func testDecodable() {
        // Given
        let json = """
          {
            "first-name": "Steve",
            "last-name": "Dave"
          }
        """.data(using: .utf8)!
        
        // When
        let contact: Contact
        do {
            contact = try JSONDecoder().decode(Contact.self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertEqual(contact.firstName, "Steve")
        XCTAssertEqual(contact.lastName, "Dave")
    }
    
    func testEncodable() {
        // Given
        let contact = Contact()
        contact.firstName = "Robert"
        contact.lastName = "Webster"
        
        // When
        let data: Data
        let json: [String: Any]?
        do {
            data = try JSONEncoder().encode(contact)
            json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertNotNil(json)
        XCTAssertEqual(json?.count, 2)
        
        XCTAssertEqual(json?["first-name"] as? String, "Robert")
        XCTAssertEqual(json?["last-name"] as? String, "Webster")
    }
    
}
