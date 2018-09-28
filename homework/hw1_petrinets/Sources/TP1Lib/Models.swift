import PetriKit

/* public enum Place: CaseIterable {
  case r, p, t, m, w1, w2, w3, s1, s2, s3
} */

public func createBoundedModel() -> PTNet<Place> {
  
  return createModel()
}

public enum Place2: CaseIterable {
  
  case s0, s1, s2, s3, s4, b
  
}

public func createUnboundedModel() -> PTNet<Place2> {
  
  return PTNet(

    transitions: [
      PTTransition(
        named         : "t0",
        preconditions : [PTArc(place: .s0), PTArc(place: .s4)],
        postconditions: [PTArc(place: .s1), PTArc(place: .b )]),
      PTTransition(
        named         : "t1",
        preconditions : [PTArc(place: .s1)],
        postconditions: [PTArc(place: .s0), PTArc(place: .s4)]),
      PTTransition(
        named         : "t2",
        preconditions : [PTArc(place: .s2), PTArc(place: .s4), PTArc(place: .b )],
        postconditions: [PTArc(place: .s3)]),
      PTTransition(
        named         : "t3",
        preconditions : [PTArc(place: .s3)],
        postconditions: [PTArc(place: .s2), PTArc(place: .s4)]),
      ])
}
