# Bad pratice

## TP1 SMV

Here, a compilation of bad practices !  
Be care for the next TP !

### 1)

```swift
var Work = [marking]
var M : PTNet<Place>.MarkingType
```

NEVER, NEVER, NEVER a variable name which starts by a capital letter. Capital letter must be used for class/structures...
Moreover, avoid to give a name just with one letter. We should understand what contains a variable with its name.

### 2)

```swift
//print(M)
```

Two points:
- We know you use print to test your code, however when you finish, think to remove it. It's difficult to make the difference between your commentary and your tests.
- It's a good pratice to let a space after `//` --> `// Hello`.

### 3)

```swift
 marquageInf=false
```

It's better to write with a space before and after the equal.

```swift
marquageInf = false
```

### 4)

```swift
if !graphs.contains(where:
{$0.marking == M_prime})
```

INDENTATION ! It's not a problem if you want to split your code, but you should have:
```swift
if !graphs.contains(where:
  // SHIFT
  {$0.marking == M_prime})
```

Same if you have a loop / condition:

```swift
if true:
  // SHIFT
  print("INDENTATION")
```

### 5)

```swift

        }

       }



     }
```

???

```swift

        }
       }
     }
```

A small effort !

### 6)

Choose one language when you're programming ! We don't want variable names in english and french in the same program.
