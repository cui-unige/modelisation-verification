# Modeling and Verification @ [University of Geneva](http://www.unige.ch)

This repository contains important information about this course.
**Do not forget to [watch](https://github.com/cui-unige/modelisation-verification/subscription) it** as it will allow us to send notifications for events,
such as new exercises, homework, slides or fixes.

## Important Information and Links

* [Page on GitHub: `https://github.com/cui-unige/modelisation-verification`](https://github.com/cui-unige/modelisation-verification)
* Courses are Thursday 14:00 - 16:00
* Exercises are Thursday 16:00 - 18:00
* Team: Prof. Didier Buchs, Stefan Klikovits, Damien Morard
* Use Github issues to communicate with us (public)
* For private matters send an email or come see us in our offices: 
    * `didier.buchs@unige.ch` (office 217) 
    * `stefan.klikovits@unige.ch` (office 222) 
    * `damien.morard@etu.unige.ch` (office 221)

## Environment

This course requires the following **mandatory** environment.
We have taken great care to make it as simple as possible.

* [GitHub](https://github.com): a source code hosting platform
  that we will for the exercises and homework.
  Create an account, and **do not forget** to fill your profile with your full name
  and your University email address.
  Ask GitHub for a [Student Pack](https://education.github.com/pack) to obtain
  free private repositories.
* [MacOS High Sierra](https://www.apple.com/macos/high-sierra/)
  or [Ubuntu 18.04 LTS 64bits](https://www.ubuntu.com/download/desktop),
  if needed in a virtual machine, for instance using [VirtualBox](http://virtualbox.org),
  or directly with a dual boot.
* [Atom](https://atom.io): a text editor, that we will use to type the sources.

You also have to:
* [Watch](https://github.com/cui-unige/modelisation-verification/subscription)
  the [course page](https://github.com/cui-unige/modelisation-verification)
  to get notifications about the course.
* [Create a **private** repository](https://help.github.com/articles/creating-a-new-repository/)
  named `modelisation-verification` (exactly). It has to be **empty** (no README, no license).
* [Clone the private repository](https://help.github.com/articles/cloning-a-repository/)

  ```sh
  git clone https://github.com/YOURUSERNAME/modelisation-verification.git
  ```

* Add the course repository as a remote (to receive updates, TP material, etc).

  ```sh
  git remote add course https://github.com/cui-unige/modelisation-verification.git
  ```
  
* [Add as collaborators](https://help.github.com/articles/inviting-collaborators-to-a-personal-repository/)
  the users: [`stklik`](https://github.com/stklik) (Stefan Klikovits)
  and [`damdamo`](https://github.com/damdamo) (Damien Morard).

* Comment on Issue #1 with your *full name*, *link to Github profile*, *link to private repository*, *email address*
  Your response will look like something like this (except you'll replace mine with your data):  
  E.g.  
  Stefan Klikovits, @stklik, [Stefan's Repository](http://https://github.com/stklik/modelisation-verification), stefan.klikovits@unige.ch


* [Install Swift on your local machine](https://swift.org/getting-started/#installing-swift)
  * Linux: follow instructions in the document
  * MacOS: Install XCode, launch it and accept the user agreement

* Become familiar with Swift (see tutorial linked below)
   * Official: https://swift.org/getting-started/
   * Tutorial on Swift by Dimitri Racordon (@kyouko-taiga): https://kyouko-taiga.github.io/swift-thoughts/tutorial/

   > The supported OS versions are macOS 10.13 (High Sierra) and Ubuntu 18.04.
   > You are highly encouraged to use either of those versions.




The environment you installed contains:
* [Git](https://git-scm.com/docs/gittutorial):
  the tool for source code management;
* [Atom](https://atom.io):
  the editor we will use.
  You will want to add the `language-swift` package. (Perhaps also `autocomplete-swift`).

Make sure that your [repository is up-to-date](https://help.github.com/articles/syncing-a-fork/)
by running frequently:

```sh
  git pull course master
```

## Rules

* You must do your homework in your private fork of the course repository.
* You must fill your full name in your GitHub profile.
* If for any reason you have trouble with the deadline,
  contact your teacher as soon as possible.
* The assistants must have access to your source code, but nobody else should have.
* Unless **explicitly** stated, the exercises are personal work. No collaboration, joint work or sharing of code will be tolerated. You can however discuss general approaches with your colleagues.
* Your source code (and tests) must pass all checks of `swift test`
  without warnings or errors.

## Homework
* All homeworks are located in the `homework/` directory.
* There will be a specific subfolder for each homework (e.g. `homework/hw1_petrinets`). Use it. Do not rename the folder, place your solutions anywhere else, or do other things.
* do **not rename** any files, variables, functions, classes, ... unless you are instructed to do so!
* read the complete instructions **before** starting an assignment 
* follow the instructions given to you in the assignments
* The swift compiler will warn you. 
  Make sure you don't see any warnings when you compile your code.
  You can use `swift build` to run it.
* For testing, we use [XCTest](https://developer.apple.com/documentation/xctest).
  It is already installed in your environment,
  and can run all the tests within the test folder files using: `swift test`.

### Homework Deadlines
You have until 23:59:59 on these dates to **push** your solutions to *your* (private) repository.
Generally: No late submissions, no extensions, no exceptions, no dogs eating homework. 
If you are in an unfortuante circumstance where you do need an extension, tell us beforehand.
(Sending an email two hours before the deadline is *not* beforehand).

| No.  |    1     |    2     |    3     |    4     |    5     |    6     |
| ---- | -------- | -------- | -------- | -------- | -------- | -------- |
| Date | 10. Oct. | 24. Oct. | 7.  Nov. | 21. Nov. | 5.  Dec. | 19. Dec. |

### Mandatory Code Reviews

 * Additionally to submitting homework, you will also be invited to **mandatory** code reviews.
 * Every week a handful of students will be randomly selected to come to the assistants' office and explain their code and what they have done. 
 * The reviews will be about 5 to 10 minutes long and you are expected to confidently present your work.
 * These talks will be graded.
and will be counted towards your 

### Evaluation

 * The grades of all TPs + the average of your code review grades, devided by 7
 * Example:
 
   | TP1 | TP2 | TP3 | TP4 | TP5 | TP6 | CR1 | CR2 | CR3 |
   | --- | --- | --- | --- | --- | --- | --- | --- | --- |
   |  4  |  5  |  4  |  5  |  6  |  5  |  6  |  4  |  5  |
   
   Results in this grade:  
   Average of code reviews: (6 + 4 + 5) / 3 = 5  
   Final note = (4 + 5 + 4 + 5 + 6 + 5 + 5) / 7 = 4.85

### Getting Help

You should be old and smart enough to find the solutions to most problems by yourself. I.e.:  
*If you encounter any problems, solve them!*

In case there is a problem you cannot solve, here is the order of escalation:
  1. Google is your friend. (response time < 1 sec.)
  2. Read the manual. (response time < 1 min.)
  3. Ask a friend/colleague. (response time < 30 mins.)
  4. Stackoverflow. [Learn how](https://stackoverflow.com/help/how-to-ask) (response time < 12 hrs.)
  5. Course assistants. (response time < 1 day.)
  6. Professor. (response time ???)


### Homework #0 (unmarked)

**Deadline 27.9.2018**

Make your environment work!  
Specifically:
* [ ] did you `watch` this repo
* [ ] did you create your own **PRIVATE** repo, set this repo as a remote (follow the description above)
* [ ] did you give @stklik and @damdamo as collaborators
* [ ] did you assert that you can pull from this repository and push into your private one (`git pull course master;git push`)
* [ ] did you install swift?
* [ ] did you check if can you create a swift package? (`mkdir Hello;cd Hello;swift package init`)
* [ ] did you check that your swift package compiles? (`swift build`)
* [ ] did you check that you can test the swift package? (`swift test`)
* [ ] did you install a code editor? (i.e Atom)
* [ ] did you read the [Swift tutorial](https://kyouko-taiga.github.io/swift-thoughts/tutorial/)? 
* [ ] did you reply to Issue [#1](/../../issues/1) with your *full name*, *link to Github profile* (e.g. @stklik), *link to private repository*, *email address*

<!--
### Homework #1

The source files are located within: `homework/hw1_petrinets/`.
You have to understand the provided code and fill in the missing code (marked with `TODO`).
Do **not** touch the existing code or tests,
but you can add your own tests **in a new file** within the `Tests` folder.

The deadline is 10 october 2017 at 23:59.
We will clone all your repositories using a script,
so make sure that @stklik and @damdamo have read access.

Evaluation will be:

* have you done anything at the deadline?
  (yes: 1 point, no: 0 point)
  * [ ] Done anything
* do you have understood and implemented all the required notions?
  (all: 3 points, none: 0 point)
  * [ ] Reachability graph
  * [ ] Coverability graph
* do you have understood and implemented corners cases of all the required
  notions?
  (all: +2 points, none: 0 point)
  * [ ] Reachability graph
  * [ ] Coverability graph
* do you have correctly written and tested your code?
  (no: -0.5 point for each)
  * [ ] Coding standards
  * [ ] Tests
  * [ ] Code coverage

| Grade |
| ----- |
|       |
 -->
