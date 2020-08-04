//
//  TolerablyEqual Tests.swift
//  
//
//  Created by Ben Leggiero on 2020-08-02.
//

import XCTest
import BasicMathTools



private let originalFloat64DefaultTolerance = Float64.defaultTolerance



final class TolerablyEqual_Tests: XCTestCase {
    
    override func setUp() {
        Float64.defaultTolerance = originalFloat64DefaultTolerance
    }
    
    
    func testEqualsWithTolerance() {
        XCTAssertTrue(123.456.equals(123.457, tolerance: 0.01))
        XCTAssertTrue(123.456.equals(123.457, tolerance: 0.001))
        XCTAssertFalse(123.456.equals(123.458, tolerance: 0.001))
        XCTAssertTrue(1_000_000.equals(1_000_100, tolerance: 1_000))
        XCTAssertFalse(1_000_000.equals(1_100_000, tolerance: 1_000))
    }
    
    
    func testTildeDoubleEquals_Float64() {
        
        XCTAssertFalse(0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1  == 1)
        XCTAssertTrue (0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1 ~== 1)
        
        XCTAssertFalse(2  == sqrt(2) * sqrt(2))
        XCTAssertTrue (2 ~== sqrt(2) * sqrt(2))
        
        XCTAssertTrue(5 ~== 4.9999999)
        XCTAssertTrue(5 ~== 5)
        XCTAssertTrue(5 ~== 5.0000001)
    }
    
    
    func testDefaultTolerance_Float64() {
        
        XCTAssertEqual(Float64.defaultTolerance, 0.00001)
        
        XCTAssertFalse(5 ~== 4)
        XCTAssertFalse(5 ~== 4.9)
        XCTAssertFalse(5 ~== 4.99)
        XCTAssertFalse(5 ~== 4.999)
        XCTAssertFalse(5 ~== 4.9999)
        XCTAssertTrue(5 ~== 4.99999)
        XCTAssertTrue(5 ~== 4.999999)
        XCTAssertTrue(5 ~== 5)
        XCTAssertTrue(5 ~== 5.000001)
        XCTAssertTrue(5 ~== 5.00001)
        XCTAssertFalse(5 ~== 5.0001)
        XCTAssertFalse(5 ~== 5.001)
        XCTAssertFalse(5 ~== 5.01)
        XCTAssertFalse(5 ~== 5.1)
        XCTAssertFalse(5 ~== 6)
        
        XCTAssertFalse(5 ~== 4.99998)
        XCTAssertFalse(5 ~== 5.00002)
        
        Float64.defaultTolerance = 0.1
        
        XCTAssertEqual(Float64.defaultTolerance, 0.1)
        XCTAssertTrue(5 ~== 5.0000001)
        XCTAssertTrue(5 ~== 5.000001)
        XCTAssertTrue(5 ~== 5.00001)
        XCTAssertTrue(5 ~== 5.0001)
        XCTAssertTrue(5 ~== 5.001)
        XCTAssertTrue(5 ~== 5.01)
        XCTAssertTrue(5 ~== 5.1)
        XCTAssertFalse(5 ~== 6)
    }
    
    
    static var allTests = [
        ("testEqualsWithTolerance", testEqualsWithTolerance),
        ("testTildeDoubleEquals_Float64", testTildeDoubleEquals_Float64),
        ("testDefaultTolerance_Float64", testDefaultTolerance_Float64),
    ]
}
