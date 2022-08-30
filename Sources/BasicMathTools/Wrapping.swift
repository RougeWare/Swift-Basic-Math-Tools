//
//  Wrapping.swift
//  
//
//  Created by S🌟System on 2022-08-20.
//

import Foundation



/// A type which supports being wrapped within a range of values
public protocol Wrappable: Comparable {
    
    /// Converts this value so that it repeats within `range`
    ///
    /// If the value doesn't fit within `range`, then the returned value loops back to the beginning of the range until it fits.
    ///
    /// For example:
    /// ```swift
    /// print(0.wrapped(within: 3..<6)) // 3
    /// print(1.wrapped(within: 3..<6)) // 4
    /// print(2.wrapped(within: 3..<6)) // 5
    /// print(3.wrapped(within: 3..<6)) // 3
    /// print(4.wrapped(within: 3..<6)) // 4
    /// print(5.wrapped(within: 3..<6)) // 5
    /// print(6.wrapped(within: 3..<6)) // 3
    /// print(7.wrapped(within: 3..<6)) // 4
    /// print(8.wrapped(within: 3..<6)) // 5
    /// ```
    ///
    /// - Parameters:
    ///   - range: The range of lowest (inclusive) & highest (exclusive) possible return values.
    ///            The returned value will wrap (loop) within this range
    ///
    /// - Returns: This value, wrapped to be within `range`
    func wrapped(within range: Range<Self>) -> Self
    
    
    /// Applies a [mathematical modulo](https://en.wikipedia.org/wiki/Modulo_operation) operation to this value
    ///
    /// - Parameter rhs: The value to divide by
    ///
    /// - Returns: The remainder of dividing by `rhs`
    func mod(_ rhs: Self) -> Self
}



/// Converts this value so that it repeats within `range`
///
/// If the value doesn't fit within `range`, then the returned value loops back to the beginning of the range until it fits.
///
/// For example:
/// ```swift
/// print(wrap(min: 3, value: 0, max: 6) // 3
/// print(wrap(min: 3, value: 1, max: 6) // 4
/// print(wrap(min: 3, value: 2, max: 6) // 5
/// print(wrap(min: 3, value: 3, max: 6) // 3
/// print(wrap(min: 3, value: 4, max: 6) // 4
/// print(wrap(min: 3, value: 5, max: 6) // 5
/// print(wrap(min: 3, value: 6, max: 6) // 3
/// print(wrap(min: 3, value: 7, max: 6) // 4
/// print(wrap(min: 3, value: 8, max: 6) // 5
/// ```
///
/// - Parameters:
///   - min:   The returned value will start wrapping at this value
///   - value: The value to be wrapped
///   - max:   The returned value will wrap back to the beginning just before reaching this
///
/// - Returns: `value`, wrapped to be between `min` (inclusive) and `max` (exclusive)
@inline(__always)
public func wrap <Value: Wrappable> (min: Value, value: Value, max: Value) -> Value {
    value.wrapped(within: min..<max)
}



// MARK: - Default Conformance

public extension Wrappable where Self: AdditiveArithmetic {
    
    func wrapped(within range: Range<Self>) -> Self {
        guard !range.contains(self) else {
            return self
        }
        
        let breadth = range.upperBound - range.lowerBound

        let baseResult = (self - range.lowerBound).mod(breadth)

        if baseResult < .zero {
            return range.lowerBound + baseResult + breadth
        }
        else {
            return range.lowerBound + baseResult
        }
    }
}



public extension Wrappable where Self: BinaryInteger {
    func mod(_ rhs: Self) -> Self {
        self % rhs
    }
}



extension Int: Wrappable {}
extension Int8: Wrappable {}
extension Int16: Wrappable {}
extension Int32: Wrappable {}
extension Int64: Wrappable {}

extension UInt: Wrappable {}
extension UInt8: Wrappable {}
extension UInt16: Wrappable {}
extension UInt32: Wrappable {}
extension UInt64: Wrappable {}



// MARK: - Default Conformance

extension Float32: Wrappable {}
extension Float64: Wrappable {}
extension Float80: Wrappable {}
extension CGFloat: Wrappable {}

public extension Wrappable where Self: FloatingPoint {
    func mod(_ rhs: Self) -> Self {
        self.truncatingRemainder(dividingBy: rhs)
    }
}
