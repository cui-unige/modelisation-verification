import XCTest

extension ProofTests {
    static let __allTests = [
      ("testInduction1", testInduction1),
      ("testInduction2", testInduction2),
      ("testInduction3", testInduction3),
      ("testInduction4", testInduction4)
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ProofTests.__allTests)
    ]
}
#endif
