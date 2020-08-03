//
//  Equality with tolerance.swift
//  
//
//  Created by Ben Leggiero on 2020-08-02.
//

import Foundation



public extension SignedNumeric where Self: AdditiveArithmetic, Self: Comparable {
    /// Determines whether this number is equal to the other one, within the given tolerance.
    ///
    /// For example:
    /// ```swift
    /// 123.456.equals(123.457, tolerance: 0.01) == true
    /// 123.456.equals(123.457, tolerance: 0.001) == true
    /// 123.456.equals(123.458, tolerance: 0.001) == false
    /// 1_000_000.equals(1_000_100, tolerance: 1_000) == true
    /// 1_000_000.equals(1_100_000, tolerance: 1_000) == false
    /// ```
    ///
    ///
    /// - Parameters:
    ///   - other:     The other number to compare to this one
    ///   - tolerance: The maximum distance which `other` is allowed to be away from `self`
    ///
    /// - Returns: `true` iff `self` and `other` are, at most `tolerance` apart from each other
    func equals(_ other: Self, tolerance: Self) -> Bool {
        return abs(self - other) <= tolerance
    }
}
