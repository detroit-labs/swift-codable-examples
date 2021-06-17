//
//  VehicleTests.swift
//  CodableTests
//
//  Created by Nathan Walczak on 6/15/21.
//  Copyright © 2021 Detroit Labs. All rights reserved.
//

import XCTest
@testable import Codable

class VehicleTests: XCTestCase {
    
    func testDecodableBicycle() {
        // Given
        let json = Data("""
          {
            "bicycle": {}
          }
        """.utf8)
        
        // When
        let vehicle: Vehicle
        do {
            vehicle = try JSONDecoder().decode(Vehicle.self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertEqual(vehicle, .bicycle)
    }
    
    func testDecodableBoat() {
        // Given
        let json = Data("""
          {
            "boat": {
              "floats": true
            }
          }
        """.utf8)
        
        // When
        let vehicle: Vehicle
        do {
            vehicle = try JSONDecoder().decode(Vehicle.self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertEqual(vehicle, .boat(floats: true))
    }
    
    func testDecodableCar() {
        // Given
        let json = Data("""
          {
            "car": {
              "year": 2016,
              "make": "Tesla",
              "model": "Model S"
            }
          }
        """.utf8)
        
        // When
        let vehicle: Vehicle
        do {
            vehicle = try JSONDecoder().decode(Vehicle.self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertEqual(vehicle, .car(year: 2016, make: "Tesla", model: "Model S"))
    }
    
    func testDecodableLimo() {
        // Given
        let json = Data("""
          {
            "limo": {
              "_0": "Black",
              "something": true,
              "_2": 8
            }
          }
        """.utf8)
        
        // When
        let vehicle: Vehicle
        do {
            vehicle = try JSONDecoder().decode(Vehicle.self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertEqual(vehicle, .limo("Black", something: true, 8))
    }
    
    func testDecodableTruck() {
        // Given
        let json = Data("""
          {
            "truck": {
              "wheels": 18
            }
          }
        """.utf8)
        
        // When
        let vehicle: Vehicle
        do {
            vehicle = try JSONDecoder().decode(Vehicle.self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertEqual(vehicle, .truck(wheels: 18))
    }
    
    func testDecodableVan() {
        // Given
        let json = Data("""
          {
            "van": {
              "contents": ["Wrench", "Hammer"]
            }
          }
        """.utf8)
        
        // When
        let vehicle: Vehicle
        do {
            vehicle = try JSONDecoder().decode(Vehicle.self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertEqual(vehicle, .van(contents: ["Wrench", "Hammer"]))
    }
    
}
