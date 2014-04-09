# firebase-humanhash
### Human-readable representations of Firebase `push()` IDs for JavaScript

## Why?

To borrow words from [the project](https://github.com/zacharyvoase/humanhash) that inspired this one, the intent is to generate a human-readable (and, most importantly, *memorable*) representation of a Firebase `push()` ID, unique enough for display in a user interface, where a user may need to remember or verbally communicate the identity of a push()ed location, without having to remember a 20-character random sequence of uppercase/lowercase letters and numbers.

For example, if you're developing a ticket tracker, it's likely that you're using Firebase's `push()` to generate new tickets. However, `-JJWYEO-S7K2HTDyeQvV` is not very user-friendly if you need to display a ticket number in your app. You could generate ticket numbers through some other process but that's more code and data to you have to maintain, and you've stepped outside the realm of using Firebase as your sole server-side solution.

What if you could increase the chance of displaying a non-unique ID marginally (for all practical purposes), while increasing the the human-readability of the ID dramatically? That's where this library comes in. You still use a Firebase `push()` ID to store your tickets in Firebase, but at the moment of display, you "humanize" the ID.

## What's unique *enough*?

This library maps each byte of a 20-byte Firebase `push()` ID to a smaller fixed-length representation (from 1 to 19 bytes, default: 4 bytes) using a user-provided dictionary of 256 "words." The number of words chosen corresponds to its statistical uniqueness:

* 1 word: 1 in 256
* 2 words: 1 in 65,536
* 3 words: 1 in 16,777,216
* 4 words: 1 in 4,294,967,300
* etc.

As you can see, even with the default 4 byte compression, the uniqueness can be very high.

## How?

### Input

Node.js:
```coffeescript
HH = require "firebase-humanhash"
DEFAULT_HASHER = new HH.HumanHasher()
NUMBER_HASHER = new HH.HumanHasher NUMBER_WORDLIST
id = "-JJWYEO-S7K2HTDyeQvV"
console.log DEFAULT_HASHER.humanize id
console.log DEFAULT_HASHER.humanize id, words=6
console.log DEFAULT_HASHER.humanize id, words=20
console.log NUMBER_HASHER.humanize id, 4, ""
```

Also works in the browser as a global or an AMD module.

### Output

	autumn-lactose-apart-louisiana
    grey-georgia-floor-delaware-jersey-berlin
    Words must be between 1 and 19
    014116006125

## Contributions

This library was made possible by:

* https://github.com/zacharyvoase/humanhash
* https://github.com/shabda/humanhash-coffeescript
