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
        
        XCTAssertFalse(0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1  == 1.0)
        XCTAssertTrue (0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1 ~== 1.0)
        
        XCTAssertFalse(2  == sqrt(2) * sqrt(2))
        XCTAssertTrue (2 ~== sqrt(2) * sqrt(2))
        
        XCTAssertTrue(5 ~== 4.9999999)
        XCTAssertTrue(5 ~== 5)
        XCTAssertTrue(5 ~== 5.0000001)
    }
    
    
    func testDefaultTolerance_Float32() {
        
        XCTAssertEqual(Float32.defaultTolerance, 0.0001)
        
        XCTAssertFalse(5 ~== 4 as Float32)
        XCTAssertFalse(5 ~== 4.9 as Float32)
        XCTAssertFalse(5 ~== 4.99 as Float32)
        XCTAssertFalse(5 ~== 4.999 as Float32)
        XCTAssertFalse(5 ~== 4.9999 as Float32)
        XCTAssertTrue(5 ~== 4.99999 as Float32)
        XCTAssertTrue(5 ~== 4.999999 as Float32)
        XCTAssertTrue(5 ~== 5 as Float32)
        XCTAssertTrue(5 ~== 5.000001 as Float32)
        XCTAssertTrue(5 ~== 5.00001 as Float32)
        XCTAssertFalse(5 ~== 5.0001 as Float32)
        XCTAssertFalse(5 ~== 5.001 as Float32)
        XCTAssertFalse(5 ~== 5.01 as Float32)
        XCTAssertFalse(5 ~== 5.1 as Float32)
        XCTAssertFalse(5 ~== 6 as Float32)
        
        XCTAssertFalse(5 ~== 4.9998 as Float32)
        XCTAssertFalse(5 ~== 5.0002 as Float32)
        
        Float32.defaultTolerance = 0.1
        
        XCTAssertEqual(Float32.defaultTolerance, 0.1)
        XCTAssertTrue(5 ~== 5.0000001 as Float32)
        XCTAssertTrue(5 ~== 5.000001 as Float32)
        XCTAssertTrue(5 ~== 5.00001 as Float32)
        XCTAssertTrue(5 ~== 5.0001 as Float32)
        XCTAssertTrue(5 ~== 5.001 as Float32)
        XCTAssertTrue(5 ~== 5.01 as Float32)
        XCTAssertTrue(5 ~== 5.1 as Float32)
        XCTAssertFalse(5 ~== 6 as Float32)
    }
    
    
    func testDefaultTolerance_Float64() {
        
        XCTAssertEqual(Float64.defaultTolerance, 0.00001)
        
        XCTAssertFalse(5 ~== 4 as Float64)
        XCTAssertFalse(5 ~== 4.9 as Float64)
        XCTAssertFalse(5 ~== 4.99 as Float64)
        XCTAssertFalse(5 ~== 4.999 as Float64)
        XCTAssertFalse(5 ~== 4.9999 as Float64)
        XCTAssertTrue(5 ~== 4.99999 as Float64)
        XCTAssertTrue(5 ~== 4.999999 as Float64)
        XCTAssertTrue(5 ~== 5 as Float64)
        XCTAssertTrue(5 ~== 5.000001 as Float64)
        XCTAssertTrue(5 ~== 5.00001 as Float64)
        XCTAssertFalse(5 ~== 5.0001 as Float64)
        XCTAssertFalse(5 ~== 5.001 as Float64)
        XCTAssertFalse(5 ~== 5.01 as Float64)
        XCTAssertFalse(5 ~== 5.1 as Float64)
        XCTAssertFalse(5 ~== 6 as Float64)
        
        XCTAssertFalse(5 ~== 4.99998 as Float64)
        XCTAssertFalse(5 ~== 5.00002 as Float64)
        
        Float64.defaultTolerance = 0.1
        
        XCTAssertEqual(Float64.defaultTolerance, 0.1)
        XCTAssertTrue(5 ~== 5.0000001 as Float64)
        XCTAssertTrue(5 ~== 5.000001 as Float64)
        XCTAssertTrue(5 ~== 5.00001 as Float64)
        XCTAssertTrue(5 ~== 5.0001 as Float64)
        XCTAssertTrue(5 ~== 5.001 as Float64)
        XCTAssertTrue(5 ~== 5.01 as Float64)
        XCTAssertTrue(5 ~== 5.1 as Float64)
        XCTAssertFalse(5 ~== 6 as Float64)
    }
    
    
    #if arch(x86_64) && os(macOS)
    func testDefaultTolerance_Float80() {
        
        XCTAssertEqual(Float80.defaultTolerance, 0.000001)
        
        XCTAssertFalse(5 ~== 4 as Float80)
        XCTAssertFalse(5 ~== 4.9 as Float80)
        XCTAssertFalse(5 ~== 4.99 as Float80)
        XCTAssertFalse(5 ~== 4.999 as Float80)
        XCTAssertFalse(5 ~== 4.9999 as Float80)
        XCTAssertFalse(5 ~== 4.99999 as Float80)
        XCTAssertFalse(5 ~== 4.999999 as Float80)
        XCTAssertTrue(5 ~== 4.9999999 as Float80)
        XCTAssertTrue(5 ~== 4.99999999 as Float80)
        XCTAssertTrue(5 ~== 5 as Float80)
        XCTAssertTrue(5 ~== 5.00000001 as Float80)
        XCTAssertTrue(5 ~== 5.0000001 as Float80)
        XCTAssertFalse(5 ~== 5.000001 as Float80)
        XCTAssertFalse(5 ~== 5.00001 as Float80)
        XCTAssertFalse(5 ~== 5.0001 as Float80)
        XCTAssertFalse(5 ~== 5.001 as Float80)
        XCTAssertFalse(5 ~== 5.01 as Float80)
        XCTAssertFalse(5 ~== 5.1 as Float80)
        XCTAssertFalse(5 ~== 6 as Float80)
        
        XCTAssertFalse(5 ~== 4.999998 as Float80)
        XCTAssertFalse(5 ~== 5.009002 as Float80)
        
        Float80.defaultTolerance = 0.1
        
        XCTAssertEqual(Float80.defaultTolerance, 0.1)
        XCTAssertTrue(5 ~== 5.0000001 as Float80)
        XCTAssertTrue(5 ~== 5.000001 as Float80)
        XCTAssertTrue(5 ~== 5.00001 as Float80)
        XCTAssertTrue(5 ~== 5.0001 as Float80)
        XCTAssertTrue(5 ~== 5.001 as Float80)
        XCTAssertTrue(5 ~== 5.01 as Float80)
        XCTAssertTrue(5 ~== 5.1 as Float80)
        XCTAssertFalse(5 ~== 6 as Float80)
    }
    #endif
    
    
    static var allTests = [
        ("testEqualsWithTolerance", testEqualsWithTolerance),
        ("testTildeDoubleEquals_Float64", testTildeDoubleEquals_Float64),
        ("testDefaultTolerance_Float64", testDefaultTolerance_Float64),
    ]
}
