import PetriKit

public enum Place: CaseIterable {
  
  case r, p, t, m, w1, w2, w3, s1, s2, s3
  
}

public func createModel() -> PTNet<Place> {
  
  let tpt = PTTransition(
    named: "tpt",
    preconditions: (
      [
        PTArc(place: Place.r)
      ]
    ),
    postconditions: (
      [
        PTArc(place: Place.t)
      ]
    )
  )
  
  
  let tpm = PTTransition(
    named: "tpm",
    preconditions: (
      [
        PTArc(place: Place.r)
      ]
    ),
    postconditions: (
      [
        PTArc(place: Place.m)
      ]
    )
  )
  
  let ttm = PTTransition(
    named: "ttm",
    preconditions: (
      [
        PTArc(place: Place.r)
      ]
    ),
    postconditions: (
      [
        PTArc(place: Place.t)
      ]
    )
  )
  
  let ts1 = PTTransition(
    named: "ts1",
    preconditions: (
      [
        PTArc(place: Place.p),
        PTArc(place: Place.t)
      ]
    ),
    postconditions: (
      [
        PTArc(place: Place.r),
        PTArc(place: Place.s1)
      ]
    )
  )
  
  let ts2 = PTTransition(
    named: "ts2",
    preconditions: (
      [
        PTArc(place: Place.p),
        PTArc(place: Place.m)
      ]
    ),
    postconditions: (
      [
        PTArc(place: Place.r),
        PTArc(place: Place.s2)
      ]
    )
  )
  
  let ts3 = PTTransition(
    named: "ts3",
    preconditions: (
      [
        PTArc(place: Place.t),
        PTArc(place: Place.m)
      ]
    ),
    postconditions: (
      [
        PTArc(place: Place.r),
        PTArc(place: Place.s3)
      ]
    )
  )
  
  let tw1 = PTTransition(
    named: "tw1",
    preconditions: (
      [
        PTArc(place: Place.s1)
      ]
    ),
    postconditions: (
      [
        PTArc(place: Place.w1),
        ]
    )
  )
  
  let tw2 = PTTransition(
    named: "tw2",
    preconditions: (
      [
        PTArc(place: Place.s2)
      ]
    ),
    postconditions: (
      [
        PTArc(place: Place.w2),
        ]
    )
  )
  
  let tw3 = PTTransition(
    named: "tw3",
    preconditions: (
      [
        PTArc(place: Place.s3, label: 1)
      ]
    ),
    postconditions: (
      [
        PTArc(place: Place.w3),
        ]
    )
  )
  
  return PTNet(transitions: [tpt, tpm, ttm, ts1, ts2, ts3, tw1, tw2, tw3])
  
}
