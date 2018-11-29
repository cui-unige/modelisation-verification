# Modélisation et vérification de logiciel: TP5

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
* There will be a specific subfolder for each homework (e.g. `homework/hw5_kripke_ctl`). Use it. Do not rename the folder, place your solutions anywhere else, or do other things.
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
  - TP5
    - CTL.swift
    - CTL.Extension.swift
    - Kripke.swift
    - Kripke+Extension.swift
- Tests
  - TP5Tests
    - TP5Tests.swift
```

### Reduce CTL Formula (3 points)

You need to write the reduction normal form of CTL Formula. Look at the course to help you and complete **TODO** in the file `Sources/TP5/CTL+Extension.swift`.
We use the pattern matching of *swift* which is so powerful ! Try to understand how a CTL Formula is constructed before starting work. Don't forget the recursivity !

```swift
switch ctl_formula {

case .ap(let ap):
  return .ap(ap)

case .true:
  return .true

...

}
```

### Compute CTL Formula (3 points)

In this section, we want to compute our CTL formula. You have to achieve the part above to be able to test this part. You can find all informations in the pdf `MCCTL.pdf`. The code to complete can be find with **TODO** in the file `Sources/TP5/Kripke+Extension`. Try to understand how a Kripke Structure is constructed before starting work. Don't forget the recursivity !
You have an example with .ap (ap: atomic proposition) to help you.

```swift
public func compute(_ ctl_formula: CTL) -> Set<String> {

  switch ctl_formula {

  case .ap(let x):
    var state_list: Set<String> = []
    for node in self.nodes {
      if node.value.contains(x) {
        state_list.insert(node.key)
      }
    }
    return state_list

    ...

  case .ef(let x):
    // TODO
    return []

  // Don't touch the default value
  default: return []
  }

}
```



## Information

**IMPORTANT**:  
- **READ** and **UNDERSTAND** Kripke structure and CTL !
- **READ** the course, you have everything in it.
- **Avoid** to add other `case`, you don't need it.
- I have never written more than 10 lines of code per compute function. Hence, think about it if you have too many lines.
- **READ** `tests` to understand how it works and try to do your own tests. (But don't commit it)

## How are you evaluated ?

You have two parts to complete the exercise. Each part is worth 3 points
**Lisibility** and **comment** are always essential, don't forget it !
