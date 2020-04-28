// Author: John Ngoi
// Book: Interviewing in Swift:
// Algorithms and Data Structures:
// Your guide in helping you prepare for the real world of software engineering interviews as an iOS or Mac OS developer.
// Available on Amazon and Kindle! Search for "john ngoi" to find the book!
// ASIN: B01L8DY5H6
//
// Valid Parentheses
//
// Given a string with alphanumeric characters and parentheses, determine if the string has valid matching open and close parentheses.
//
// Swift 5.2.2
//
// Strategy
// We can use a stack to keep track if the string has valid open and close parentheses.
// This takes up O(n) space.
// We can further reduce the space complexity by simply using a counter.
// The space is now constant, which reduces the space complexity to O(1).
// For every open parenthesis, we +1. For every close parenthesis we -1.
// If we ever encounter a situation where the counter is less than 0, it is impossible for that string to ever be valid.
// In this condition, we return false.
//
// Time O(n)
// Space O(1)

func isValidParentheses(text: String) -> Bool {
    guard !text.isEmpty else { return true }
    
    var numOfOpenParenthesis = 0
    
    for c in text {
        if c == "(" {
            numOfOpenParenthesis += 1
        } else if c == ")" {
            if numOfOpenParenthesis == 0 {
                return false
            } else {
                numOfOpenParenthesis -= 1
            }
        }
    }
    
    if numOfOpenParenthesis == 0 {
        return true
    } else {
        return false
    }
}

// let's test!
let test1 = "(a)"
let test2 = "((bba()"
let test3 = "(((ew)))"
let test4 = "(as)((bqw))"
let test5 = "(("
let test6 = ")()"
let test7 = "((((((()))))))"
let test8 = "(((((((())))))"
let test9 = "()()()()()()"
let test10 = "()((())())"
let test11 = "))(("

print(test1 + ": " + String(describing: isValidParentheses(text: test1)))
print(test2 + ": " + String(describing: isValidParentheses(text: test2)))
print(test3 + ": " + String(describing: isValidParentheses(text: test3)))
print(test4 + ": " + String(describing: isValidParentheses(text: test4)))
print(test5 + ": " + String(describing: isValidParentheses(text: test5)))
print(test6 + ": " + String(describing: isValidParentheses(text: test6)))
print(test7 + ": " + String(describing: isValidParentheses(text: test7)))
print(test8 + ": " + String(describing: isValidParentheses(text: test8)))
print(test9 + ": " + String(describing: isValidParentheses(text: test9)))
print(test10 + ": " + String(describing: isValidParentheses(text: test10)))
print(test11 + ": " + String(describing: isValidParentheses(text: test11)))
