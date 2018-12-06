# Modélisation et vérification de logiciel: TP6

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
* There will be a specific subfolder for each homework (e.g. `homework/hw6_SFDD`). Use it. Do not rename the folder, place your solutions anywhere else, or do other things.
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

## Your task:

File Tree:

```
- Sources
  - hw6_SFDD
    - Factory.swift
    - SFDD.swift
    - SFDD+Extension.swift
- Tests
  - hw6_SFDDTests
    - hw6_SFDDTests.swift
```

### Complete SFDD functions (6 points)

You need to complete four functions for SFDD. Look at the course to help you and complete **TODO** in the file `Sources/hw6_SFDD/SFDD.swift`.

You have to complete:
- `contains`
- `union`
- `intersection`
- `subtracting`

Before starting think to understand what is a SFDD. You need to understand how we can construct a SFDD with references.  
Factory class is the core of our code, we have what we call a **uniquessTable** ! We want to be sure to not have the same object two times. We represent each object once time (to have the less object as possible). Hence, we use references to avoid this kind of issue.

Care, function `makeNode` in `Sources/hw6_SFDD/Factory.swift` depends on the function union. So, your priority have to be implemented `union` !

## Information

**IMPORTANT**:  
- **READ** and **UNDERSTAND** SFDD !
- **READ** the course, you have everything in it.
- **READ** and **USE** functions that already exist in the code ! Take the time to understand the code !
- **READ** `tests` to understand how it works and try to do your own tests. (But don't commit it)

## How are you evaluated ?

You have one part, which is divided in four functions to complete the exercise. Each function is worth 1.5 points.
**Lisibility** and **comment** are always essential, don't forget it !
