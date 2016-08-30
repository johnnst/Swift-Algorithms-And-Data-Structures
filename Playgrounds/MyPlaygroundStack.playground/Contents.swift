//: Playground - noun: a place where people can play

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
stack.push(2)
stack.push(5)
stack.push(7)
stack.push(3)
print(stack.stack) // prints [2, 5, 7, 3]
let value = stack.pop()
print(stack.stack) // prints [2, 5, 7]

