# Swift Basic Math Tools #

Some basic tools for doing math in Swift



# Wrapping #

This allows any number to be wrapped within a range of numbers.

For example, with a range of floats from `3..<5`, here's how the numbers from `-10` to `10` would wrap:

![A chart depicting a sawtooth-style wrapping of numbers, 3.0 through 4.9, repeating left to right](https://i.imgur.com/a8V6kta.png)

The syntax is really simple:

```swift
value.wrapped(within: range)
```

So for the above example, you might do:
```swift
value.wrapped(within: 3..<5)
```

You can also use the global function if that makes more sense for your software:

```swift
wrap(min: 3, value: value, max: 5)
```



# Tolerable Equality #

This allows you to compare two values for equality, within a certain tolerance!

This is done with a protocol that is already applied to all the language's built-in signed numbers, but which can be applied to anything.

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
