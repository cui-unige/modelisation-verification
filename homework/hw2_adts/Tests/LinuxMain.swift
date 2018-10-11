import XCTest
@testable import TP2Tests
@testable import ADTTests
@testable import EqProofTests



XCTMain([
	 testCase(ProofKitLibTests.allTests),
     testCase(ADTTests.allTests),
     testCase(EqProofTests.allTests)
])
