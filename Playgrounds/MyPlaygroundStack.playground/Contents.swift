// Author: John Ngoi
// Book: Interviewing in Swift:
// Algorithms and Data Structures:
// Your guide in helping you prepare for the real world of software engineering interviews as an iOS or Mac OS developer.
// Available on Amazon and Kindle! Search for "john ngoi" to find the book!
// ASIN: B01L8DY5H6
//
// Stack

import UIKit

var s = [2, 5, 7, 3]
// push
s.append(9)
print(s) // print [2, 5, 7, 3, 9]

// pop
let pop = s.removeLast()
print(s) // print [2, 5, 7, 3]

// stack class
class Stack {
    var stack = [Int]()
    
    func push (value: Int) {
        stack.append(value)
    }
    
    func pop () -> Int? {
        if stack.count > 0 {
            return stack.removeLast()
        }
        return nil
    }
}

let stack = Stack()
stack.push(value: 2)
stack.push(value: 5)
stack.push(value: 7)
stack.push(value: 3)
print(stack.stack) // prints [2, 5, 7, 3]
let value = stack.pop()
print(stack.stack) // prints [2, 5, 7]
