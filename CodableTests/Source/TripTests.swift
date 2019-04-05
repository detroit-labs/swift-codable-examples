//
//  TripTests.swift
//  CodableTests
//
//  Created by Nate Walczak on 3/27/19.
//  Copyright © 2019 Detroit Labs. All rights reserved.
//

import XCTest
@testable import Codable

class TripTests: XCTestCase {
    
    func testDecodableUsingISO8601() {
        // Given
        let json = """
          {
            "origin": "Atlanta, GA",
            "departure": "2019-03-28T08:15:02Z",
            "destination": "Detroit, MI",
            "arrival": "2019-04-01T18:45:20Z"
          }
        """.data(using: .utf8)!
        
        // When
        let trip: Trip
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            trip = try decoder.decode(Trip.self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertEqual(trip.origin, "Atlanta, GA")
        XCTAssertEqual(trip.departure, departureDate)
        XCTAssertEqual(trip.destination, "Detroit, MI")
        XCTAssertEqual(trip.arrival, arrivalDate)
    }
    
    func testEncodableUsingISO8601() {
        // Given
        let trip = Trip()
        trip.origin = "Atlanta, GA"
        trip.departure = departureDate
        trip.destination = "Detroit, MI"
        trip.arrival = arrivalDate
        
        // When
        let data: Data
        let json: [String: Any]?
        do {
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .iso8601
            data = try encoder.encode(trip)
            json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertNotNil(json)
        XCTAssertEqual(json?.count, 4)
        
        XCTAssertEqual(json?["origin"] as? String, "Atlanta, GA")
        XCTAssertEqual(json?["departure"] as? String, "2019-03-28T08:15:02Z")
        XCTAssertEqual(json?["destination"] as? String, "Detroit, MI")
        XCTAssertEqual(json?["arrival"] as? String, "2019-04-01T18:45:20Z")
    }
    
    func testDecodableUsingYearMonthDayFormat() {
        // Given
        let json = """
          {
            "origin": "Atlanta, GA",
            "departure": "2019-03-28",
            "destination": "Detroit, MI",
            "arrival": "2019-04-01"
          }
        """.data(using: .utf8)!
        
        // When
        let trip: Trip
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            trip = try decoder.decode(Trip.self, from: json)
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertEqual(trip.origin, "Atlanta, GA")
        XCTAssertEqual(trip.departure, departureDateWithoutTime)
        XCTAssertEqual(trip.destination, "Detroit, MI")
        XCTAssertEqual(trip.arrival, arrivalDateWithoutTime)
    }
    
    func testEncodableUsingYearMonthDayFormat() {
        // Given
        let trip = Trip()
        trip.origin = "Atlanta, GA"
        trip.departure = departureDateWithoutTime
        trip.destination = "Detroit, MI"
        trip.arrival = arrivalDateWithoutTime
        
        // When
        let data: Data
        let json: [String: Any]?
        do {
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .formatted(dateFormatter)
            data = try encoder.encode(trip)
            json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            XCTFail(error.localizedDescription)
            return
        }
        
        // Then
        XCTAssertNotNil(json)
        XCTAssertEqual(json?.count, 4)
        
        XCTAssertEqual(json?["origin"] as? String, "Atlanta, GA")
        XCTAssertEqual(json?["departure"] as? String, "2019-03-28")
        XCTAssertEqual(json?["destination"] as? String, "Detroit, MI")
        XCTAssertEqual(json?["arrival"] as? String, "2019-04-01")
    }
}

extension TripTests {
    
    var estCalendar: Calendar {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(abbreviation: "EST")!
        return calendar
    }
    
    var gmtCalendar: Calendar {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        return calendar
    }
    
    // 2019-03-28 at 04:15:02 AM EST
    var departureDate: Date? {
        var components = DateComponents(calendar: estCalendar)
        components.year = 2019
        components.month = 3
        components.day = 28
        components.hour = 4
        components.minute = 15
        components.second = 2
        return components.date
    }
    
    // 2019-03-28
    var departureDateWithoutTime: Date? {
        var components = DateComponents(calendar: gmtCalendar)
        components.year = 2019
        components.month = 3
        components.day = 28
        return components.date
    }
    
    // 2019-04-01 at 02:45:20 PM EST
    var arrivalDate: Date? {
        var components = DateComponents(calendar: estCalendar)
        components.year = 2019
        components.month = 4
        components.day = 1
        components.hour = 14
        components.minute = 45
        components.second = 20
        return components.date
    }
    
    // 2019-04-01
    var arrivalDateWithoutTime: Date? {
        var components = DateComponents(calendar: gmtCalendar)
        components.year = 2019
        components.month = 4
        components.day = 1
        return components.date
    }
    
    var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        return dateFormatter
    }
    
}
