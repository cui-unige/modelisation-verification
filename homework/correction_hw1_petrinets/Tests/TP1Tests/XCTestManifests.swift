import XCTest

extension CoverabilityLibTests {
    static let __allTests = [
        ("testBoundedGraph", testBoundedGraph),
        ("testMultiPaths", testMultiPaths),
        ("testUnboundedGraph", testUnboundedGraph),
    ]
}

extension SmokersLibTests {
    static let __allTests = [
        ("testCreateModel", testCreateModel),
        ("testMarkingGraph", testMarkingGraph),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(CoverabilityLibTests.__allTests),
        testCase(SmokersLibTests.__allTests),
    ]
}
#endif
