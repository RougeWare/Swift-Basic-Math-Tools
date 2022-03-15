//
//  Equality with tolerance.swift
//  BasicMathTools
//
//  Created by Ben Leggiero on 2020-08-02.
//

import Foundation
import CoreGraphics.CGBase



/// A type which can have its equality compared within a certain tolerance
public protocol TolerablyEqual {
    
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
    func equals(_ other: Self, tolerance: Self) -> Bool
    
    
    /// The tolerance in equality-comparisons used when none is specified. Setting this will determine how all future
    /// tolerably-equal checks behave.
    static var defaultTolerance: Self { get set }
    
    
    /// Determines whether the left umber is equal to the right, within the default tolderance.
    ///
    /// To read and change the default tolerance, use the static `defaultTolerance` variable.
    ///
    /// - Parameters:
    ///   - lhs: The first value to compare
    ///   - rhs: The value to compare to the first value, within the default tolerance
    static func ~==(lhs: Self, rhs: Self) -> Bool
}



// MARK: - Operator

/// Indicates approximate equality. For example, `1.0 ~== 1.000000001`
infix operator ~== : ComparisonPrecedence



// MARK: Synthesis

public extension TolerablyEqual {
    static func ~==(lhs: Self, rhs: Self) -> Bool {
        lhs.equals(rhs, tolerance: defaultTolerance)
    }
}



public extension TolerablyEqual
    where Self: SignedNumeric,
          Self: Comparable
{
    func equals(_ other: Self, tolerance: Self) -> Bool {
        return abs(self - other) <= tolerance
    }
}



// MARK: Default Conformances

extension CGFloat: TolerablyEqual { public static var defaultTolerance = CGFloat(CGFloat.NativeType.defaultTolerance) }
extension Float32: TolerablyEqual { public static var defaultTolerance: Float32 = 0.0001 }
extension Float64: TolerablyEqual { public static var defaultTolerance: Float64 = 0.00001 }
#if arch(x86_64) && os(macOS)
extension Float80: TolerablyEqual { public static var defaultTolerance: Float80 = 0.000001 }
#endif

extension Int:   TolerablyEqual { public static var defaultTolerance: Int   = 0 }
extension Int8:  TolerablyEqual { public static var defaultTolerance: Int8  = 0 }
extension Int16: TolerablyEqual { public static var defaultTolerance: Int16 = 0 }
extension Int32: TolerablyEqual { public static var defaultTolerance: Int32 = 0 }
extension Int64: TolerablyEqual { public static var defaultTolerance: Int64 = 0 }
