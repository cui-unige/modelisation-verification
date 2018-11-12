import XCTest
import LogicKit
import TP4


class ProofTests: XCTestCase {


  internal func tassert(_ a: Term,_ b: Term){
    let msg = "\(ADTm.pprint(a)) == \(ADTm.pprint(b))"
    print(msg)
    XCTAssertTrue(ADTm.eval(a).equals(ADTm.eval(b)), msg)
  }

  internal func TAssert(_ a: Rule, _ b: Rule){
    let msg = "(\(a)) == (\(b))"
    print(msg)
    XCTAssertTrue(a.equals(b),msg)
  }

  internal func FAssert(_ a: Rule, _ b: Rule){
    let msg = "(\(a)) != (\(b))"
    print(msg)
    XCTAssertFalse(a.equals(b),msg)
  }

  override func setUp() {
    super.setUp()
  }


  func testInduction1(){

    // PROOF OF: suc(0) + x = suc(x)

    // Our axioms / theorems (What we can use)
    // We write below just to list them
    // We can easily copy paste in our functions
    // zero_proof and succ_proof

    // x + 0 = x
    // let ax0 = ADTm["nat"].a("+")[0]
    // x + s(y) = s(x + y)
    // let ax1 = ADTm["nat"].a("+")[1]

    // What we want to proove
    let conj = Rule(
      //suc(0) + x -> suc(x)
      Nat.add(Nat.succ(x: Nat.zero()), Variable(named:"x")),
      Nat.succ(x: Variable(named: "x"))
    )

    // Inductive proof

    // 1) Initial case
    // suc(0) + 0 = suc(0)
    func zero_proof(t: Rule...)->Rule{

      // x + 0 = x
      let ax0 = ADTm["nat"].a("+")[0]

      // Substitution ax0: x -> s(0)
      // s(0)+0 = s(0)
      return Proof.substitution(ax0, Variable(named: "x"), Nat.succ(x: Nat.zero()))
    }

    // 2) Inductive case
    // Our hypothesis:
    // s(0) + x = s(x)
    // Successor:
    // s(0) + s(x) = s(s(x))
    func succ_proof(t: Rule...)->Rule{

      // x + s(y) = s(x + y)
      let ax1 = ADTm["nat"].a("+")[1]

      // suc(0) + x -> suc(x)
      let conj = Rule(
        Nat.add(Nat.succ(x: Nat.zero()), Variable(named:"x")),
        Nat.succ(x: Variable(named: "x"))
      )

      // Substitution ax1: x -> s(0)
      // s(0) + s(y) = s(s(0) + y)
      let t0 = Proof.substitution(ax1, Variable(named: "x"), Nat.succ(x: Nat.zero()))

      // Substitutivity conj: succ
      // s(0) + x = s(x) -> s(s(0) + x) = s(s(x))
      let t1 = Proof.substitutivity (Nat.succ, [conj])

      // Transitivity t0 -> t1
      // s(0) + s(y) = s(s(y))
      return Proof.transitivity(t0, t1)
    }

    do {
      let theorem = try Proof.inductive(conj, Variable(named: "x"), ADTm["nat"], [
        "zero": zero_proof,
        "succ": succ_proof
        ]
      )
      print("Inductive result: \(theorem)")
    }
    catch ProofError.InductionFail {
      print("Induction failed!")
      XCTFail()
    }
    catch {
      XCTFail()
    }

  }

  func testInduction2(){

    // PROOF OF: 0 + x = x

    // Our axioms / theorems (What we can use)
    // We write below just to list them
    // We can easily copy paste in our functions
    // zero_proof and succ_proof

    // x + 0 = x
    // let ax0 = ADTm["nat"].a("+")[0]
    // x + s(y) = s(x + y)
    // let ax1 = ADTm["nat"].a("+")[1]

    // What we want to proove
    let conj = Rule(
      //0 + x -> x
      Nat.add(Nat.zero(), Variable(named:"x")),
      Variable(named: "x")
    )

    // Inductive proof

    // 1) Initial case
    // 0 + 0 = 0
    func zero_proof(t: Rule...)->Rule{

      // x + 0 = x
      let ax0 = ADTm["nat"].a("+")[0]
      // x + s(y) = s(x + y)
      let ax1 = ADTm["nat"].a("+")[1]

      // TODO: Write initial case
      // Change return

      return ax0

    }

    let init_case = Rule(
      Nat.add(Nat.zero(), Nat.zero()),
      Nat.zero()
    )

    TAssert(zero_proof(), init_case)


    // 2) Inductive case
    // Our hypothesis:
    // 0 + x = x
    // Successor:
    // 0 + s(x) = s(x)
    func succ_proof(t: Rule...)->Rule{

      // x + 0 = x
      let ax0 = ADTm["nat"].a("+")[0]
      // x + s(y) = s(x + y)
      let ax1 = ADTm["nat"].a("+")[1]
      // 0 + x = x
      let t0 = Rule(
        Nat.add(Nat.zero(), Variable(named:"x")),
        Variable(named: "x")
      )

      // TODO: Write inductive case
      // Change return

      return ax0
    }

    // 0 + s(x) = s(x)
    let inductive_case = Rule(
      Nat.add(Nat.zero(), Nat.succ(x: Variable(named: "x"))),
      Nat.succ(x: Variable(named: "x"))
    )

    TAssert(succ_proof(), inductive_case)

    do {
      let theorem = try Proof.inductive(conj, Variable(named: "x"), ADTm["nat"], [
        "zero": zero_proof,
        "succ": succ_proof
        ]
      )
      print("Inductive result: \(theorem)")
    }
    catch ProofError.InductionFail {
      print("Induction failed!")
      XCTFail()
    }
    catch {
      XCTFail()
    }

  }


  func testInduction3(){

    // PROOF OF: x + 0 = 0 + x

    // Our axioms / theorems (What we can use)
    // We write below just to list them
    // We can easily copy paste in our functions
    // zero_proof and succ_proof

    // x + 0 = x
    // let ax0 = ADTm["nat"].a("+")[0]
    // x + s(y) = s(x+y)
    // let ax1 = ADTm["nat"].a("+")[1]


    let conj = Rule(
      //x + 0 = 0 + x
      Nat.add(Variable(named:"x"), Nat.zero()),
      Nat.add(Nat.zero(), Variable(named: "x"))
    )

    print("Conjecture: \(conj)")

    // Function for inductive proof

    // Initial case
    // 0 + 0 = 0 + 0
    func zero_proof(t: Rule...)->Rule{

      // x + 0 = x
      let ax0 = ADTm["nat"].a("+")[0]
      // x + s(y) = s(x+y)
      let ax1 = ADTm["nat"].a("+")[1]

      // TODO: Write initial case
      // Change return

      return ax0
    }

    let init_case = Rule(
      Nat.add(Nat.zero(), Nat.zero()),
      Nat.add(Nat.zero(), Nat.zero())
    )

    TAssert(zero_proof(), init_case)

    // Inductive case
    // Our hypothesis:
    // x + 0 = 0 + x
    // Successor:
    // s(x) + 0 = 0 + s(x)
    func succ_proof(t: Rule...)->Rule{

      // x + 0 = 0 + x
      let conj = Rule(Nat.add(Variable(named: "x"), Nat.zero()), Nat.add(Nat.zero(), Variable(named: "x")))
      // x + 0 = x
      let ax0 = ADTm["nat"].a("+")[0]
      // x + s(y) = s(x + y)
      let ax1 = ADTm["nat"].a("+")[1]

      // TODO: Write inductive case
      // Change return

      return ax0
    }

    // s(x) + 0 = 0 + s(x)
    let inductive_case = Rule(
      Nat.add(Nat.succ(x: Variable(named: "x")), Nat.zero()),
      Nat.add(Nat.zero(), Nat.succ(x: Variable(named: "x")))
    )

    TAssert(succ_proof(), inductive_case)

    do {
      let theorem = try Proof.inductive(conj, Variable(named: "x"), ADTm["nat"], [
        "zero": zero_proof,
        "succ": succ_proof
        ]
      )
      print("Inductive result: \(theorem)")
    }
    catch ProofError.InductionFail {
      print("Induction failed!")
      XCTFail()
    }
    catch {
      XCTFail()
    }
  }

  func testInduction4(){

    // PROOF OF: s(0) + x = x + s(0)

    // Our axioms / theorems (What we can use)
    // We write below just to list them
    // We can easily copy paste in our functions
    // zero_proof and succ_proof

    // x + 0 = x
    // let ax0 = ADTm["nat"].a("+")[0]
    // x + s(y) = s(x + y)
    // let ax1 = ADTm["nat"].a("+")[1]
    // x + 0 = 0 + x
    // let t0 = Rule(Nat.add(Variable(named: "x"), Nat.zero()), Nat.add(Nat.zero(), Variable(named: "x")))
    // 0 + s(x) = s(0) + x
    // let t1 = Rule(Nat.add(Nat.zero(), Nat.succ(x: Variable(named: "x"))), Nat.add(Nat.succ(x: Nat.zero()), Variable(named: "x")))

    // What we want to proove
    let conj = Rule(
      // s(0) + x -> x + s(0)
      Nat.add(Nat.succ(x: Nat.zero()), Variable(named:"x")),
      Nat.add(Variable(named: "x"), Nat.succ(x: Nat.zero()))
    )

    // Inductive proof

    // 1) Initial case
    // s(0) + 0 = 0 + s(0)
    func zero_proof(t: Rule...)->Rule{

      // x + 0 = x
      let ax0 = ADTm["nat"].a("+")[0]
      // x + s(y) = s(x + y)
      let ax1 = ADTm["nat"].a("+")[1]

      // TODO: Write initial case
      // Change return

      return ax0
    }

    let init_case = Rule(
      Nat.add(Nat.succ(x: Nat.zero()), Nat.zero()),
      Nat.add(Nat.zero(), Nat.succ(x: Nat.zero()))
    )

    TAssert(zero_proof(), init_case)


    // 2) Inductive case
    // Our hypothesis:
    // s(0) + x = x + s(0)
    // Successor:
    // s(0) + s(x) = s(x) + s(0)
    func succ_proof(t: Rule...)->Rule{

      // x + 0 = x
      let ax0 = ADTm["nat"].a("+")[0]
      // x + s(y) = s(x + y)
      let ax1 = ADTm["nat"].a("+")[1]
      // x + 0 = 0 + x
      let t0 = Rule(Nat.add(Variable(named: "x"), Nat.zero()), Nat.add(Nat.zero(), Variable(named: "x")))
      // 0 + s(x) = s(0) + x
      let t1 = Rule(Nat.add(Nat.zero(), Nat.succ(x: Variable(named: "x"))), Nat.add(Nat.succ(x: Nat.zero()), Variable(named: "x")))
      // s(0) + x -> x + s(0)
      let conj = Rule(Nat.add(Nat.succ(x: Nat.zero()), Variable(named:"x")), Nat.add(Variable(named: "x"), Nat.succ(x: Nat.zero())))

      // TODO: Write inductive case
      // Change return

      return ax0
    }

    // s(0) + s(x) = s(x) + s(0)
    let inductive_case = Rule(
      Nat.add(Nat.succ(x: Nat.zero()), Nat.succ(x: Variable(named: "x"))),
      Nat.add(Nat.succ(x: Variable(named: "x")), Nat.succ(x: Nat.zero()))
    )

    TAssert(succ_proof(), inductive_case)

    do {
      let theorem = try Proof.inductive(conj, Variable(named: "x"), ADTm["nat"], [
        "zero": zero_proof,
        "succ": succ_proof
        ]
      )
      print("Inductive result: \(theorem)")
    }
    catch ProofError.InductionFail {
      print("Induction failed!")
      XCTFail()
    }
    catch {
      XCTFail()
    }

  }


}
