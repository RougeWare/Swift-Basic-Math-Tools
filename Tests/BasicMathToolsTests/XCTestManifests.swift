import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(BasicMathToolsTests.allTests),
    ]
}
#endif
