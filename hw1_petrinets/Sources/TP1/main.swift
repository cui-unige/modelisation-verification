import PetriKit
import TP1Lib
import Foundation


// Instantiate the model.
let model = createModel()


// Create the initial marking.
let initialMarking: Marking<Place, UInt> = [.r: 1, .p: 0, .t: 0, .m: 0, .w1: 1, .s1: 0, .w2: 1, .s2: 0, .w3: 1, .s3: 0]


// Create the marking graph (if possible).
if let markingGraph = model.markingGraph(from: initialMarking) {
    // Write here the code necessary to answer questions of Exercise 4.
}


// print(URL(fileURLWithPath: "model.dot"))
// try model.saveAsDot(to: URL(fileURLWithPath: "model.dot"), withMarking: [Place.r: 1, Place.w1: 1, Place.w2: 1, Place.w3: 1, Place.p: 0, Place.t: 0, Place.m: 0, Place.s1: 0, Place.s2: 0, Place.s3: 0])
