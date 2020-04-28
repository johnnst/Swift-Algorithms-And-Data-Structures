// Author: John Ngoi
// Book: Interviewing in Swift:
// Algorithms and Data Structures:
// Your guide in helping you prepare for the real world of software engineering interviews as an iOS or Mac OS developer.
// Available on Amazon and Kindle! Search for "john ngoi" to find the book!
// ASIN: B01L8DY5H6
//
// Remove minimum characters to make valid parentheses
// Given a String text, remove the minimum number of characters to make the parentheses valid.
//
// For example:
// text = "())", output = "()"
// text = "))((", output = ""
// text = "jo(h(n()ng)oi", output = "joh(n()ng)oi" OR "jo(hn()ng)oi" OR "jo(h(n)ng)oi"
//
// Time O(n)
// Space O(n), because of the stack

func minimumCharacters(text: String) -> String {
    guard !text.isEmpty else { return text }
    
    var chars = [Character](text)
    var stack = [(Character, Int)]()
    
    for i in chars.indices {
        if chars[i] == "(" {
            stack.append((chars[i], i))
        } else if chars[i] == ")" {
            if stack.count > 0 {
                if stack[stack.endIndex - 1].0 == "(" {
                    stack.removeLast()
                } else {
                    stack.append((chars[i], i))
                }
            } else {
                stack.append((chars[i], i))
            }
        }
    }
    
    let indexes = stack.map { $0.1 }
    
    for i in indexes.reversed() {
        chars.remove(at: i)
    }
    
    return String(chars)
}


let test1 = "())"
let test2 = "(a)a)"
let test3 = "(a"
let test4 = "a)"
let test5 = "(((()((())))))))"
let test6 = "())))))"
let test7 = "a())"
let test8 = "))(("
let test9 = "jo(h(n()ng)oi"

print(minimumCharacters(text: test1))
print(minimumCharacters(text: test2))
print(minimumCharacters(text: test3))
print(minimumCharacters(text: test4))
print(minimumCharacters(text: test5))
print(minimumCharacters(text: test6))
print(minimumCharacters(text: test7))
print(minimumCharacters(text: test8))
print(minimumCharacters(text: test9))
