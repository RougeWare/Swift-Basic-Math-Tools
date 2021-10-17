//
//  Clamps.swift
//  BasicMathTools
//
//  Created by Ky Leggiero on 10/16/21.
//

import Foundation



/// Returns the given `value`, or `min` if it's less than `min`, or `max` if it's greater than `max`
///
/// - Parameters:
///   - min:   The lowest possible returned value
///   - value: The value to be clamped
///   - max:   The highest possible returned value
///
/// - Returns: `value`, clamped to be between `min` (inclusive) and `max` (inclusive)
@inline(__always)
public func clamp <Value: Comparable> (min: Value, value: Value, max: Value) -> Value {
    Swift.max(min, Swift.min(value, max))
}



public extension Comparable {
    
    /// Returns this value, or `min` if it's less than `min`, or `max` if it's greater than `max`
    ///
    /// - Parameters:
    ///   - min:   The lowest possible returned value
    ///   - max:   The highest possible returned value
    ///
    /// - Returns: this value, clamped to be between `min` (inclusive) and `max` (inclusive)
    @inline(__always)
    func clamped(min: Self, max: Self) -> Self {
        clamp(min: min, value: self, max: max)
    }
    
    
    /// Returns this value, or `range.lowerBound` if it's less than `range.lowerBound`, or `range.upperBound` if it's greater than `range.upperBound`
    ///
    /// - Parameter range: The range of possible values to be returned
    ///
    /// - Returns: this value, clamped to be between `range.lowerBound` (inclusive) and `range.upperBound` (inclusive)
    @inline(__always)
    func clamped(within range: ClosedRange<Self>) -> Self {
        clamped(min: range.lowerBound, max: range.upperBound)
    }
}
