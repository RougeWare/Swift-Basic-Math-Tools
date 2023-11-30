//
//  additive reductions tests.swift
//  
//
//  Created by The Northstar✨ System on 2023-11-30.
//

import XCTest
import BasicMathTools



final class additive_reductions_tests: XCTestCase {
    func testSum() {
        XCTAssertEqual(29, [1, 2, 3, 5, 7, 11].sum())
        XCTAssertEqual(0, [1, -1, 1, -1, 1, -1].sum())
    }
    
    
    func testReduce() {
        XCTAssertEqual(-58, [1, 2, 3, 5, 7, 11].reduce { result, each in
            result = (result - (each * 2))
        })
        
        XCTAssertEqual(-29, [1, 2, 3, 5, 7, 11].reduce(-=))
        
        XCTAssertEqual(0, [1, 2, 3, 5, 7, 11].reduce(*=))
        
        XCTAssertEqual(56, [8, -31, 11, -13, 56, 27, -2].reduce { $0 = max($0, $1) })
    }
}
