// Author: John Ngoi
// Book: Interviewing in Swift:
// Algorithms and Data Structures:
// Your guide in helping you prepare for the real world of software engineering interviews as an iOS or Mac OS developer.
// Available on Amazon and Kindle! Search for "john ngoi" to find the book!
// ASIN: B01L8DY5H6
//
// Given a string, determine if it is a palindrome.
// A palindrome is where the string spelled in either direction is the same.
//
// For example:
// "dad" is a palindrome
// "madam" is a palindrome
// "a" is a palindrome
// "bad" is not a palindrome. The reverse is spelled "dab".
// Assume the string has no spaces.
//
// Strategy
// Use pointers to iterate from the beginning and last character, until it meets in the middle.
// Time O(n)
// Space O(1), using pointers saves space!

func isPalindrome(_ text: String) -> Bool {
    guard !text.isEmpty else { return true }
    
    let text = [Character](text) // easier to work with an array of characters than a String
    var i = 0
    var j = text.count - 1
    
    while i < j {
        defer {
            i += 1
            j -= 1
        }
        
        if text[i] != text[j] {
            return false
        }
    }
    
    return true
}

func isPalindromeSwift(_ text: String) -> Bool {
    guard !text.isEmpty else { return true }
    
    var i = 0
    var j = text.count - 1
    
    while i < j {
        defer {
            i += 1
            j -= 1
        }

        if text[text.index(text.startIndex, offsetBy: i)] != text[text.index(text.startIndex, offsetBy: j)] {
            return false
        }
    }
    
    return true
}

func printResults(_ input: String) {
    print("\(input) is \(isPalindrome(input))")
}

printResults("dad")
printResults("bad")
printResults("a")
printResults("bb")
printResults("ccc")
printResults("madam")

isPalindromeSwift("dad")
isPalindromeSwift("bad")

extension String {
    subscript(value: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: value)]
    }
}


func isPalindromeSwiftSubscript(_ text: String) -> Bool {
    guard !text.isEmpty else { return true }
    
    var i = 0
    var j = text.count - 1
    
    while i < j {
        defer {
            i += 1
            j -= 1
        }
        if text[i] != text[j] {
            return false
        }
    }
    
    return true
}

isPalindromeSwiftSubscript("dad")
isPalindromeSwiftSubscript("bad")

