# Modélisation et vérification de logiciel: TP4

---
## Rules

* You must do your homework in your private fork of the course repository.
* You must fill your full name in your GitHub profile.
* If for any reason you have trouble with the deadline,
  contact your teacher as soon as possible.
* The assistants must have access to your source code, but nobody else should have.
* Unless **explicitly** stated, the exercises are personal work. No collaboration, joint work or sharing of code will be tolerated. You can however discuss general approaches with your colleagues.
* Your source code (and tests) must pass all checks of `swift test`
  without warnings or errors.
---

## Homework
* All homeworks are located in the `homework/` directory.
* There will be a specific subfolder for each homework (e.g. `homework/hw4_writing_proofs`). Use it. Do not rename the folder, place your solutions anywhere else, or do other things.
* do **not rename** any files, variables, functions, classes, ... unless you are instructed to do so!
* read the complete instructions **before** starting an assignment
* follow the instructions given to you in the assignments
* The swift compiler will warn you.
  Make sure you don't see any warnings when you compile your code.
  You can use `swift build` to run it.
* For testing, we use [XCTest](https://developer.apple.com/documentation/xctest).
  It is already installed in your environment,
  and can run all the tests within the test folder files using: `swift test`.

---


# Implementing ADTs

## Your task: Writing Proofs

For this TP, you have 3 proofs to write (in Swift):
- 0 + x = 0
- x + 0 = 0 + x
- s(0) + x = x + s(0)

All the things you have to do are in the *tests* part.  
The work is in the file: `Tests/TP4Tests/ProofTests.swift`.  
You just need to complete parts where is a `TODO`. The goal of this TP is to write the three induction proofs above with *Swift*. You have the same library as the TP2 and TP3.

### How is writing an induction proof in *Swift* ?

```Swift
func testInduction(){

  // What we want to prove
  let conj = Rule(
    // Conjecture you want to prove
  )

  // Inductive proof

  // Prove initial case
  func zero_proof(t: Rule...)->Rule{
    // TODO HERE
  }

  // Prove induction case
  func succ_proof(t: Rule...)->Rule{
    // TODO HERE
  }

  // Execute your proof and tell you if it is correct.
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
```

For the three examples, you have to write functions `zero_proof`and `succ_proof`.  
You have already axioms / theorems / conjecture that you can use inside these functions.

Functions that you should/can use to help you:
- Proof.symmetry(Rule) -> Rule
- Proof.transitivity(Rule, Rule) -> Rule
- Proof.substitutivity(Term, [Rule]) -> Rule
- Proof.substitution(Rule, Variable, Term) -> Rule
- (Proof.reflexivity(Term) -> Rule)



## Information

**IMPORTANT**:  
- The first induction test is given as example.
- **VERIFY AND WRITE YOUR PROOF** before to start coding
- Library does not verify if you have the right to make a substitution or not (be sure of what you do). **WE DON'T WANT TO SEE MAGIC SUBSTITUTIONS. DON'T MAKE SUBSTITUTIONS ON THE CONJECTURE. We will verify your proof manually.**
- **Comment each** operations that you apply (as first induction example). If we can't understand your code, you can lose up to a point.
- Care order of your rules (symmetry)
- Transitivity of: a = b, b = c -> a = c (Transitivity is often needed)
- You can try to print (to help you)

## How are you evaluated ?

You have three proofs to complete the exercise. Each proof is worth 2 points.
We will verify your proof manually. You can pass tests and don't any have points if your proof is not correct.  
 **Lisibility and Comment are indispensable**.
