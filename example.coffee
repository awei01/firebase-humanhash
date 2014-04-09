HH = require "./firebase-humanhash"

DEFAULT_HASHER = new HH.HumanHasher()
id = "-JJWYEO-S7K2HTDyeQvV"
console.log DEFAULT_HASHER.humanize id
console.log DEFAULT_HASHER.humanize id, words=6
NUMBER_HASHER = new HH.HumanHasher HH.NUMBER_WORDLIST
console.log NUMBER_HASHER.humanize id, 4, ""
