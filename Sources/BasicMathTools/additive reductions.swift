//
//  additive reductions.swift
//
//
//  Created by The Northstar✨ System on 2023-11-30.
//

import Foundation



public extension Sequence where Element: AdditiveArithmetic {
    
    /// Reduces this collection to a single value, assuming the result should be of the same type as each element, and that the starting value for reduction is `.zero`
    ///
    /// - Parameters:
    ///   - reducer: Processes each element and reduces this collection to a single value
    ///    - result: The running result of reduction (starts with `.zero`)
    ///    - each: Each element of the sequence
    ///
    /// - Returns: The whole collection, reduced down to a single value
    func reduce(_ reducer: (_ result: inout Element, _ each: Element) -> Void) -> Element {
        reduce(into: .zero, reducer)
    }
    
    
    /// Returns the sum of all elements in this sequence
    func sum() -> Element {
        reduce(+=)
    }
}
