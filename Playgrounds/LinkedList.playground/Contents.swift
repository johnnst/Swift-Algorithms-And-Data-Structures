// Author: John Ngoi
// Book: Interviewing in Swift:
// Algorithms and Data Structures:
// Your guide in helping you prepare for the real world of software engineering interviews as an iOS or Mac OS developer.
// Available on Amazon and Kindle! Search for "john ngoi" to find the book!
// ASIN: B01L8DY5H6
//
// Linked List

/// Linked list node.
class Node {
    var value: Int
    var next: Node?
    
    init (value: Int, next: Node?) {
        self.value = value
        self.next = next
    }
}

// create the nodes
let root = Node(value: 5, next: nil)
let second = Node(value: 9, next: nil)
let third = Node(value: 2, next: nil)
let fourth = Node(value: 8, next: nil)

// then join the nodes together to form a linked list
root.next = second
second.next = third
third.next = fourth

// to test, you can see if you can print all the values from the node starting from the first node
var currentNode = root
print("printing a linked list ...")
while currentNode.next != nil {
    print("\(currentNode.value)")
    currentNode = currentNode.next!
}
print("\(currentNode.value)")
print("... done printing linked list")

/// A simple linked list class.
class LinkedList {
    var root: Node?
    
    func insert (node: Node) {
        if root == nil {
            self.root = node
        } else {
            var currentNode = self.root!
            while currentNode.next != nil {
                currentNode = currentNode.next!
            }
            currentNode.next = node
        }
    }
    
    func printNodes () -> String {
        var result = ""
        if self.root == nil {
            result = "Empty linked list"
        } else {
            var currentNode = self.root!
            result += "\(currentNode.value)"
            while currentNode.next != nil {
                currentNode = currentNode.next!
                result += " \(currentNode.value)"
            }
        }
        return result
    }
}

let list = LinkedList()
let root2 = Node(value: 5, next: nil)
let second2 = Node(value: 9, next: nil)
let third2 = Node(value: 2, next: nil)
let fourth2 = Node(value: 8, next: nil)
list.insert(node: root2)
list.insert(node: second2)
list.insert(node: third2)
list.insert(node: fourth2)
let nodes = list.printNodes()
print(nodes)

/// Reverse a linked list
///
/// Time O(n)
/// Space O(1)
/// - Parameter root: The root node of a linked list.
/// - Returns: The new root node of the reversed linked list.
func reverseLinkedList (root: Node?) -> Node? {
    if root == nil {
        return nil
    }
    
    // then, traverse the linked list and store them in the stack
    var currentNode: Node? = root
    var previousNode: Node?
    while currentNode != nil {
        let next = currentNode!.next
        currentNode!.next = previousNode
        previousNode = currentNode
        currentNode = next
    }

    return previousNode
}

var reversedNode = reverseLinkedList(root: root)
// test the linked list by printing them in the new order
print("printing a linked list that was reversed ...")
while reversedNode?.next != nil {
    print(reversedNode?.value ?? "unknown")
    reversedNode = reversedNode?.next!
}
print(reversedNode?.value ?? "unknown")
print("... done printing linked list")

/// A simple queue implementation using a linked list.
class Queue {
    var root: Node?
    var count = 0
    
    func enqueue (node: Node) {
        if self.root == nil {
            self.root = node
            self.count += 1
        } else {
            var currentNode = self.root!
            while currentNode.next != nil {
                
                currentNode = currentNode.next!
            }
            currentNode.next = node
            self.count += 1
        }
    }
    
    func dequeue () -> Node? {
        if self.root == nil {
            return nil
        }
        
        let node = self.root!
        self.root = node.next
        node.next = nil
        self.count -= 1
        return node
    }
    
    func printNodes () -> String {
        var results = ""
        if self.root == nil {
            return results
        }
        
        var currentNode = self.root!
        results += "\(currentNode.value)"
        while currentNode.next != nil {
            currentNode = currentNode.next!
            results += " \(currentNode.value)"
        }
        return results
    }
}

// let's test!
let queue = Queue()
let root3 = Node(value: 5, next: nil)
let second3 = Node(value: 9, next: nil)
let third3 = Node(value: 2, next: nil)
let fourth3 = Node(value: 8, next: nil)
queue.enqueue(node: root3)
queue.enqueue(node: second3)
queue.enqueue(node: third3)
queue.enqueue(node: fourth3)
queue.printNodes() // returns 5 9 2 8
queue.count // returns 4
let de = queue.dequeue()
print("printing value of node that was dequeued = \(String(describing: de!.value))") // prints 5
queue.printNodes() // returns 9 2 8
queue.count // returns 3

/// Stack implemented using a linked list.
class Stack {
    var root: Node?
    var count = 0
    
    func push (node: Node) {
        if self.root == nil {
            self.root = node
            self.count += 1
        } else {
            var currentNode = self.root!
            while currentNode.next != nil {
                
                currentNode = currentNode.next!
            }
            currentNode.next = node
            self.count += 1
        }
    }
    
    func pop () -> Node? {
        if self.root == nil {
            return nil
        }
        
        var currentNode = self.root
        var previousNode: Node?
        while currentNode?.next != nil {
            previousNode = currentNode
            currentNode = currentNode!.next
        }
        previousNode?.next = nil
        self.count -= 1
        return currentNode
    }
    
    func printNodes () -> String {
        var results = ""
        if self.root == nil {
            return results
        }
        
        var currentNode = self.root!
        results += "\(currentNode.value)"
        while currentNode.next != nil {
            currentNode = currentNode.next!
            results += " \(currentNode.value)"
        }
        return results
    }
}

// let's test!
let stack = Stack()
let root4 = Node(value: 5, next: nil)
let second4 = Node(value: 9, next: nil)
let third4 = Node(value: 2, next: nil)
let fourth4 = Node(value: 8, next: nil)
stack.push(node: root4)
stack.push(node: second4)
stack.push(node: third4)
stack.push(node: fourth4)
stack.printNodes() // returns 5 9 2 8
let se = stack.pop()
print("printing value of node that was popped from stack = \(String(describing: se!.value))") // prints 8
stack.printNodes() // returns 5 9 2
