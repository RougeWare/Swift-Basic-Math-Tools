import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Equality_with_tolerance_Tests.allTests),
    ]
}
#endif
