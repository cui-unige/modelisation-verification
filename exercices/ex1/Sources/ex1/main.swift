// https://gist.github.com/damdamo

import PetriKit


public enum Place: CaseIterable {
  case p1, p2, p3, p4, p5
}

public func createModel() -> PTNet<Place> {

  let t1 = PTTransition(
    named: "t1",
    preconditions: (
      [
        PTArc(place: Place.p1)
      ]
    ),
    postconditions: (
      [
        PTArc(place: Place.p3)
      ]
    )
  )

  let t2 = PTTransition(
    named: "t2",
    preconditions: (
      [
        PTArc(place: Place.p2)
      ]
    ),
    postconditions: (
      [
        PTArc(place: Place.p4)
      ]
    )
  )

  let t3 = PTTransition(
    named: "t3",
    preconditions: (
      [
        PTArc(place: Place.p2),
        PTArc(place: Place.p3)
      ]
    ),
    postconditions: (
      [
        PTArc(place: Place.p5)
      ]
    )
  )

  return PTNet(transitions: [t1, t2, t3])

}

// Create our petrinet
let pnet = createModel()

// We get our transitions ! Remember this notation !
let t1 = pnet.transitions.first{ $0.name == "t1"}!
let t2 = pnet.transitions.first{ $0.name == "t2"}!
let t3 = pnet.transitions.first{ $0.name == "t3"}!

// We create an initial marking
let initialMarking: Marking<Place, UInt> = [.p1: 1, .p2: 1, .p3: 0, .p4: 0, .p5: 0]

// Test if t1 and t3 are fireable

print("Can we fire t1 ? \(t1.isFireable(from: initialMarking))")
print("Can we fire t3 ? \(t3.isFireable(from: initialMarking))")


// Now we try to fire transitions

let new_t1 = t1.fire(from: initialMarking)
let new_t3 = t3.fire(from: initialMarking)

print("new_t1: \(new_t1)")
print("new_t3: \(new_t3)")

// Cool ! But how can we be sure to have nil or not ?

// Solution 1 (BAD)

if t1.fire(from: initialMarking) != nil {
  print("Hey ! I'm not nil :D")
}

// Better but not the best

if t1.isFireable(from: initialMarking) {
  let t1_not_nil: Marking<Place, UInt> = t1.fire(from: initialMarking)!
  print("Hey ! I'm not nil ;)")
  print(t1_not_nil)
}

// Solution 2 (NICEEEE)

if let t1_not_nil = t1.fire(from: initialMarking) {
  print("Hey ! I'm not nil :P")
  print(t1_not_nil)
}

// WOW No optional value for this case !

var transition_array = [PTTransition<Place>]()
transition_array.append(t1)
transition_array.append(t2)
transition_array.append(t3)


let i_want_t1 = transition_array.first(where: {$0.name == "t1"})!
print("I AM \(i_want_t1)")

let t99_exists = transition_array.contains(where: {$0.name == "t99"})
print("Does t99_exists exist ? \(t99_exists)")

// Boolean: Return if there is a transition which contains the postcondition
let bool_x: Bool =
transition_array.contains(where:
  {
    $0.postconditions.contains(where: {$0 == PTArc(place: Place.p5)}) == true
  })

print(bool_x)

// PTTransition: Return the first transition that matches our postcondition
let first_x: PTTransition = transition_array.first(where: { $0.postconditions.contains(where: {$0 == PTArc(place: Place.p5)}) == true })!

print(first_x)


// How to define functions !

func hello(name: String) {
  print("Hello \(name)")
}

func hello2(_ name: String) {
  print("Hello \(name)")
}

hello(name: "Toto")
hello2("Paul")

func addInt(_ a: Int, _ b: Int) -> Int? {
  return a + b
}

print("Nil ? \(addInt(5, 5))")


// Generics Type
func swapTwoValues(_ a: inout Int, _ b: inout Int) {
  let temporaryA = a
  a = b
  b = temporaryA
}

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
  let temporaryA = a
  a = b
  b = temporaryA
}

var toto: Int = 3
var coco: Int = 5

print("Toto: \(toto)")
print("Coco: \(coco)")
swapTwoValues(&toto, &coco)
print("Toto: \(toto)")
print("Coco: \(coco)")
