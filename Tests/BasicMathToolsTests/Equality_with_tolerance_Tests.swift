//
//  File.swift
//  
//
//  Created by Ben Leggiero on 2020-08-02.
//

import XCTest
import BasicMathTools



final class Equality_with_tolerance_Tests: XCTestCase {
    
    func testBasicFunctionality() {
        XCTAssertTrue(123.456.equals(123.457, tolerance: 0.01))
        XCTAssertTrue(123.456.equals(123.457, tolerance: 0.001))
        XCTAssertFalse(123.456.equals(123.458, tolerance: 0.001))
        XCTAssertTrue(1_000_000.equals(1_000_100, tolerance: 1_000))
        XCTAssertFalse(1_000_000.equals(1_100_000, tolerance: 1_000))
    }
    
    
    static var allTests = [
        ("testBasicFunctionality", testBasicFunctionality),
    ]
}
