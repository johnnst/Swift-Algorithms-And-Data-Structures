//: Playground - noun: a place where people can play

import UIKit

var q = [2, 5, 7, 8, 9, 12, 6]
// enqueue
q.append(4)
print(q)

// dequeue
let value = q.removeFirst()
print(q)

// queue class

class Queue {
    var qu = [Int]()
    
    func enqueue (value: Int) {
        qu.append(value)
    }
    
    func dequeue () -> Int? {
        if qu.count > 0 {
            return qu.removeFirst()
        }
        return nil
    }
}

let q2 = Queue()
q2.enqueue(5)
q2.enqueue(9)
q2.enqueue(3)
print(q2.qu) // prints [5, 9, 3]
let v2 = q2.dequeue()
print(q2.qu) // prints [9, 3]

