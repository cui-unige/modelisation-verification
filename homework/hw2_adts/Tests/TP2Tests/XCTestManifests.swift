import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(TP1LibTests.allTests),
    ]
}
#endif
