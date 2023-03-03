# Indirect

## Motivation

Swift has a size limitation when dealing with structs. Beyond a specific size, you will start getting stack overflows. This library provides a property wrapper that allows to avoid such issues. 

## Getting Started

To start using the main features of the library make sure to install it on the main project.
The library repository can be found in the following link:
https://bitbucket.org/damonfer/swift-indirect

## Usage

Simply add the property wrapper to any property of the struct, like this:

```swift
struct BigStruct {
	@Indirect var part: Part 
} 
```

You can now use your BigStruct as you were before, but without stack overflow issues.

## Links

https://forums.swift.org/t/large-structs-and-stack-overflow/44820/5
https://twitter.com/jckarter/status/1355916944403095554
https://forums.swift.org/t/large-struct-cow-optimization/46921

## License

This library is released under the MIT license.

