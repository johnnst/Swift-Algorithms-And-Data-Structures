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
// Swift 5.1.3

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
let test6 = ")("
let test7 = "((((((()))))))"
let test8 = "(((((((())))))"
let test9 = "()()()()()()"
let test10 = "()((())())"

print(isValidParentheses(text: test1))
print(isValidParentheses(text: test2))
print(isValidParentheses(text: test3))
print(isValidParentheses(text: test4))
print(isValidParentheses(text: test5))
print(isValidParentheses(text: test6))
print(isValidParentheses(text: test7))
print(isValidParentheses(text: test8))
print(isValidParentheses(text: test9))
print(isValidParentheses(text: test10))
