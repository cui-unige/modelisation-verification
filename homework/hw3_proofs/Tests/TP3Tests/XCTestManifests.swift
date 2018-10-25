import XCTest

extension ADTTests {
    static let __allTests = [
        ("testBool", testBool),
        ("testInt", testInt),
        ("testNat", testNat),
        ("testSet", testSet),
        ("testSetEqual", testSetEqual),
        ("testSetNeedForEqual", testSetNeedForEqual),
    ]
}

extension ProofTests {
    static let __allTests = [
        ("testEquationalProof", testEquationalProof),
        ("testZeroSumIdentity", testZeroSumIdentity),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ADTTests.__allTests),
        testCase(ProofTests.__allTests),
    ]
}
#endif
