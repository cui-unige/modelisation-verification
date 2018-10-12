import PetriKit
import TP1Lib
import XCTest

class SmokersLibTests: XCTestCase {

    static let allTests = [
        ("testCreateModel" , testCreateModel),
        ("testMarkingGraph", testMarkingGraph),
    ]

    func testCreateModel() {
      let model = createModel() //TODO: Implement this function in SmokersLib.swift

        // Make sure all requires transitions were created.
        for transitionName in ["tpt", "tpm", "ttm", "ts1", "ts2", "ts3", "tw1", "tw2", "tw3"] {
            XCTAssertNotNil(model.transitions.first(where: { $0.name == transitionName }))
        }
    }

  public enum PlaceP: CaseIterable {
    case p
  }
  
    func testMarkingGraph() {
        let t = PTTransition(
            named         : "t",
            preconditions : [PTArc(place: PlaceP.p)],
            postconditions: [PTArc(place: PlaceP.p)])
        let net = PTNet(transitions: [t])

        var graph: MarkingGraph<PlaceP>?

        graph = net.markingGraph(from: [PlaceP.p: 0])
        XCTAssertNotNil(graph)
        if graph != nil {
            XCTAssert(graph!.marking == [PlaceP.p: 0])
            XCTAssert(graph!.successors.count == 0)
        }

        graph = net.markingGraph(from: [PlaceP.p: 1])
        XCTAssertNotNil(graph)
        if graph != nil {
            XCTAssert(graph!.marking == [PlaceP.p: 1])
            XCTAssert(graph!.successors.count == 1)

            let successor = graph!.successors[t]
            XCTAssertNotNil(successor)
            XCTAssert(successor === graph)
        }
    }
    
}
