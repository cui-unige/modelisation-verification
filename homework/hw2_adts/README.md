# Modélisation et vérification de logiciel: TP2

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
* There will be a specific subfolder for each homework (e.g. `homework/hw2_adts`). Use it. Do not rename the folder, place your solutions anywhere else, or do other things.
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

## Your task
You have to implement the following **Operators** (see below):

|ADT|Generators|Constructor|Operators|
|---|----------|-----------|---------|
|Boolean|```True() False()```|```n(Bool)```|```not(x) and(x,y) or(x,y) eq(x,y)```|
|Nat|```zero() succ(x)```|```n(Int)```|```add(x,y) mul(x,y) pre(x) sub(x,y) div(x,y) mod(x) lt(x,y) gt(x,y) eq(x,y) gcd(x,y) ```|
|Integer|```int(x,y)```|```n(Int)```|```add(x,y) mul(x,y) sub(x,y) div(x,y) abs(x), normalize(x) lt(x,y) gt(x,y) eq(x,y) sign(x) ```|

You can find all of these ADT in the folder: `Source/ProofKit/adts` (you have `// TODO` comments to guide you).  
At least one operator of each ADT is already implemented as a guidance for you.  

## Additional information

### What is a rule ?

A rule is composed of two terms, the left and the right term. When you apply a rule, the left term will be transformed into the right term.  
(Look at the implementation on: `Source/ProofKit/rule.swift`)  
For a `rule`, the function init needs at least two parameters (left and right term), but can have three. The third parameter is a condition which decides if the rule can be applied or not (For example `x > 10` must be `true`). By default, this parameter is already initialized to `Boolean.True()` (so rule can be applied).  
However you can have rules which need a change of this condition. (`condition` should always return a Boolean: `Boolean.True()` or `Boolean.False()`)

**Precision about how the library is implemented:**  

- You have to define rules for every case.
- The order of your rules is **important**, when we want to apply a rule, we go through
the rules from top to bottom. (Think of it as a: if, else if, else if, ...)

## How are you evaluated ?

You have 3 ADT to complete the exercise. Each ADT is worth 2 points, partially implemented ADTs less.
The exercises build on top of each other, meaning that you need to implement `Boolean` in order to use it in `Natural` and `Natural` itself is needed for `Integer`.
