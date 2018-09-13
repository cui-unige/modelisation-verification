# Modeling and Verification @ [University of Geneva](http://www.unige.ch)

This repository contains important information about this course.
**Do not forget to [watch](https://github.com/cui-unige/modelisation-verification/subscription) it** as it will allow us to send notifications for events,
such as new exercises, homework, slides or fixes.

## Important Information and Links

* [Page on Moodle](https://moodle.unige.ch/course/view.php?id=183)
* [Page on GitHub](https://github.com/cui-unige/modelisation-verification)
* Courses are Thursday 14:00 - 16:00
* Exercises are Thursday 16:00 - 18:00
* [Gitter](https://gitter.im/cui-unige/modelisation-verification) is available for chatting

## Environment

This course requires the following **mandatory** environment.
We have taken great care to make it as simple as possible.

* [Moodle](https://moodle.unige.ch)
  Check that you are registered in the "Modeling & Verification" classroom;
  we will not use it afterwards.
* [GitHub](https://github.com): a source code hosting platform
  that we will for the exercises and homework.
  Create an account, and **do not forget** to fill your profile with your full name
  and your University email address.
  Ask GitHub for a [Student Pack](https://education.github.com/pack) to obtain
  free private repositories.
* [MacOS High Sierra](https://www.apple.com/macos/high-sierra/)
  or [Ubuntu 16.04 LTS 64bits](https://www.ubuntu.com/download/desktop),
  in a virtual machine, using for instance [VirtualBox](http://virtualbox.org),
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
  the users: [`stklik`](https://github.com/saucisson) (Alban Linard)
  and [`damdamo`](https://github.com/mencattini) (Romain Mencattini).

* [Install Swift on your local machine](https://swift.org/getting-started/#installing-swift)
  * MacOS: Install XCode, launch it
  
  * on Linux
  ```sh
    curl -s https://raw.githubusercontent.com/cui-unige/modelisation-verification/master/bin/install | bash /dev/stdin
  ```

* Become familiar with Swift (see below)

The environment you installed contains:
* [Git](https://git-scm.com/docs/gittutorial):
  the tool for source code management;
* [Lua](https://www.lua.org):
  the programming language that we will use;
* [Luarocks](https://luarocks.org):
  a package manager for Lua;
* [Atom](https://atom.io):
  the editor we will use.
  On the first launch, Atom asks to install some missing modules.
  Do not forget to accept, or your environment will be broken.

Make sure that your [repository is up-to-date](https://help.github.com/articles/syncing-a-fork/)
by running frequently:

```sh
  git fetch course
  git merge course/master
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
* Your tests must cover at least 80% of the source code, excluding test files.

## Getting started with Swift:

https://swift.org/getting-started/

> Officially supported OS versions are macOS 10.13 (High Sierra) and Ubuntu 16.10.
> You are highly encouraged to use either of those versions.

* Tutorial on Swift: https://kyouko-taiga.github.io/swift-thoughts/tutorial/


## Homework
* All homeworks are located in the `homework/` directory.
* There will be a specific subfolder for each homework (e.g. `homework/hw1_petrinets`). Use it. Do not rename it, place your solutions anywhere else.
* For warnings about your code, we use [LuaCheck](https://github.com/mpeterv/luacheck).
  It is already installed in your environment,
  and can be run using: `luacheck src/`.
* For testing, we use [XCTest](https://developer.apple.com/documentation/xctest).
  It is already installed in your environment,
  and can run all the tests within the test folder files using: `swift test`.
* For code coverage, we use [LuaCov](http://keplerproject.github.io/luacov/).
  It is already installed in your environment,
  and can be run using: `luacov`.

### Homework Deadlines
You have until 23:59:59 on these dates to **push** your solutions to *your* (private) repository.
Generally: No late submissions, no extensions, no exceptions, no dogs eating homework. 
If you are in an unfortuante circumstance where you do need an extension, tell us beforehand.
(Sending an email two hours before the deadline is *not* beforehand).

| No. |   Date   |
| --- | -------- |
|  1  | 10. Oct. |
|  2  | 24. Oct. |
|  3  | 7.  Nov. |
|  4  | 21. Nov. |
|  5  | 5.  Dec. |
|  6  | 19. Dec. |

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
