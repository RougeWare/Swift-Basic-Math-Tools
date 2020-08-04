import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(TolerablyEqual_Tests.allTests),
    ]
}
#endif
