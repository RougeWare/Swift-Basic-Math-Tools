# Swift Basic Math Tools #

Some basic tools for doing math in Swift



# `TolerablyEqual` #

This is a protocol that is applied to all the language's built-in signed numbers, but which can be applied to anything, which lets you compare two values for equality, within a certain tolerance.

Let's look at this classic example:
```swift
let shouldBeOne = 0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1

print(shouldBeOne, shouldBeOne == 1)
// prints 0.9999999999999999 false
```


With this package, you can use the `~==` operator to easily overcome this problem
```swift
print(shouldBeOne ~== 1)
// prints true
```


You can also customize this behavior as needed:
```swift
print(1_000_000.equals(1_000_100, tolerance: 1_000))
// prints true
```

Feel free to check out the tests for more examples!



# Clamps #

This includes a few functions which make it easy to clamp a value between two others. Like Swift's `min` and `max`, these work for any `Comparable` type.

Whichever you use simply depends on your preference or needs; they all act identically:

```swift
print(clamp(min: 2, value:  0, max: 7)) // Prints 2
print(clamp(min: 2, value:  5, max: 7)) // Prints 5
print(clamp(min: 2, value: 99, max: 7)) // Prints 7

print( 0.clamping(min: 2, max: 7)) // Prints 2
print( 5.clamping(min: 2, max: 7)) // Prints 5
print(99.clamping(min: 2, max: 7)) // Prints 7

print( 0.clamping(within: 2...7)) // Prints 2
print( 5.clamping(within: 2...7)) // Prints 5
print(99.clamping(within: 2...7)) // Prints 7
```
