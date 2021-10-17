//
//  Clamps tests.swift
//  BasicMathToolsTests
//
//  Created by Ky Leggiero on 10/16/21.
//

import XCTest
import BasicMathTools



final class Clamps_Tests: XCTestCase {
    
    func testGlobalClamp() {
        XCTAssertEqual(2, clamp(min: 2, value: 0, max: 7))
        XCTAssertEqual(2, clamp(min: 2, value: 1, max: 7))
        XCTAssertEqual(2, clamp(min: 2, value: 2, max: 7))
        XCTAssertEqual(3, clamp(min: 2, value: 3, max: 7))
        XCTAssertEqual(4, clamp(min: 2, value: 4, max: 7))
        XCTAssertEqual(5, clamp(min: 2, value: 5, max: 7))
        XCTAssertEqual(6, clamp(min: 2, value: 6, max: 7))
        XCTAssertEqual(7, clamp(min: 2, value: 7, max: 7))
        XCTAssertEqual(7, clamp(min: 2, value: 8, max: 7))
        XCTAssertEqual(7, clamp(min: 2, value: 9, max: 7))
        
        
        XCTAssertEqual(2, clamp(min: 2, value: 1.9, max: 7))
        XCTAssertEqual(2, clamp(min: 2, value: 1.99, max: 7))
        XCTAssertEqual(2, clamp(min: 2, value: 1.999, max: 7))
        
        XCTAssertEqual(2.0, clamp(min: 2, value: 2.0, max: 7))
        XCTAssertEqual(2.0001, clamp(min: 2, value: 2.0001, max: 7))
        XCTAssertEqual(2.001, clamp(min: 2, value: 2.001, max: 7))
        XCTAssertEqual(2.01, clamp(min: 2, value: 2.01, max: 7))
        XCTAssertEqual(2.1, clamp(min: 2, value: 2.1, max: 7))
        
        
        XCTAssertEqual(6.9, clamp(min: 2, value: 6.9, max: 7))
        XCTAssertEqual(6.99, clamp(min: 2, value: 6.99, max: 7))
        XCTAssertEqual(6.999, clamp(min: 2, value: 6.999, max: 7))
        
        XCTAssertEqual(7.0, clamp(min: 2, value: 7.0, max: 7))
        XCTAssertEqual(7.0, clamp(min: 2, value: 7.0001, max: 7))
        XCTAssertEqual(7.0, clamp(min: 2, value: 7.001, max: 7))
        XCTAssertEqual(7.0, clamp(min: 2, value: 7.01, max: 7))
        XCTAssertEqual(7.0, clamp(min: 2, value: 7.1, max: 7))
    }
    
    
    func testInstanceWithExplicitMinAndMax() {
        XCTAssertEqual(2, 0.clamped(min: 2, max: 7))
        XCTAssertEqual(2, 1.clamped(min: 2, max: 7))
        XCTAssertEqual(2, 2.clamped(min: 2, max: 7))
        XCTAssertEqual(3, 3.clamped(min: 2, max: 7))
        XCTAssertEqual(4, 4.clamped(min: 2, max: 7))
        XCTAssertEqual(5, 5.clamped(min: 2, max: 7))
        XCTAssertEqual(6, 6.clamped(min: 2, max: 7))
        XCTAssertEqual(7, 7.clamped(min: 2, max: 7))
        XCTAssertEqual(7, 8.clamped(min: 2, max: 7))
        XCTAssertEqual(7, 9.clamped(min: 2, max: 7))
        
        
        XCTAssertEqual(2, 1.9.clamped(min: 2, max: 7))
        XCTAssertEqual(2, 1.99.clamped(min: 2, max: 7))
        XCTAssertEqual(2, 1.999.clamped(min: 2, max: 7))
        
        XCTAssertEqual(2.0, 2.0.clamped(min: 2, max: 7))
        XCTAssertEqual(2.0001, 2.0001.clamped(min: 2, max: 7))
        XCTAssertEqual(2.001, 2.001.clamped(min: 2, max: 7))
        XCTAssertEqual(2.01, 2.01.clamped(min: 2, max: 7))
        XCTAssertEqual(2.1, 2.1.clamped(min: 2, max: 7))
        
        
        XCTAssertEqual(6.9, 6.9.clamped(min: 2, max: 7))
        XCTAssertEqual(6.99, 6.99.clamped(min: 2, max: 7))
        XCTAssertEqual(6.999, 6.999.clamped(min: 2, max: 7))
        
        XCTAssertEqual(7.0, 7.0.clamped(min: 2, max: 7))
        XCTAssertEqual(7.0, 7.0001.clamped(min: 2, max: 7))
        XCTAssertEqual(7.0, 7.001.clamped(min: 2, max: 7))
        XCTAssertEqual(7.0, 7.01.clamped(min: 2, max: 7))
        XCTAssertEqual(7.0, 7.1.clamped(min: 2, max: 7))
    }
    
    
    func testInstanceWithClosedRange() {
        XCTAssertEqual(2, 0.clamped(within: 2...7))
        XCTAssertEqual(2, 1.clamped(within: 2...7))
        XCTAssertEqual(2, 2.clamped(within: 2...7))
        XCTAssertEqual(3, 3.clamped(within: 2...7))
        XCTAssertEqual(4, 4.clamped(within: 2...7))
        XCTAssertEqual(5, 5.clamped(within: 2...7))
        XCTAssertEqual(6, 6.clamped(within: 2...7))
        XCTAssertEqual(7, 7.clamped(within: 2...7))
        XCTAssertEqual(7, 8.clamped(within: 2...7))
        XCTAssertEqual(7, 9.clamped(within: 2...7))
        
        
        XCTAssertEqual(2, 1.9.clamped(within: 2...7))
        XCTAssertEqual(2, 1.99.clamped(within: 2...7))
        XCTAssertEqual(2, 1.999.clamped(within: 2...7))
        
        XCTAssertEqual(2.0, 2.0.clamped(within: 2...7))
        XCTAssertEqual(2.0001, 2.0001.clamped(within: 2...7))
        XCTAssertEqual(2.001, 2.001.clamped(within: 2...7))
        XCTAssertEqual(2.01, 2.01.clamped(within: 2...7))
        XCTAssertEqual(2.1, 2.1.clamped(within: 2...7))
        
        
        XCTAssertEqual(6.9, 6.9.clamped(within: 2...7))
        XCTAssertEqual(6.99, 6.99.clamped(within: 2...7))
        XCTAssertEqual(6.999, 6.999.clamped(within: 2...7))
        
        XCTAssertEqual(7.0, 7.0.clamped(within: 2...7))
        XCTAssertEqual(7.0, 7.0001.clamped(within: 2...7))
        XCTAssertEqual(7.0, 7.001.clamped(within: 2...7))
        XCTAssertEqual(7.0, 7.01.clamped(within: 2...7))
        XCTAssertEqual(7.0, 7.1.clamped(within: 2...7))
    }
}
