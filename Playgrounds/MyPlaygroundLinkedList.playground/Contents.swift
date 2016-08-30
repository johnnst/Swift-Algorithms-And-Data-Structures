// John Ngoi
// Linked List

// Basic Node
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
while currentNode.next != nil {
    print("\(currentNode.value)")
    currentNode = currentNode.next!
}
print("\(currentNode.value)")

// create a linked list class

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
list.insert(root2)
list.insert(second2)
list.insert(third2)
list.insert(fourth2)
list.printNodes()

// reverse linked list
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

var reversedNode = reverseLinkedList(root)
// test the linked list by printing them in the new order
while reversedNode?.next != nil {
    print(reversedNode?.value)
    reversedNode = reversedNode?.next!
}
print(reversedNode?.value)


// Implement a Queue using Linked List

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
queue.enqueue(root3)
queue.enqueue(second3)
queue.enqueue(third3)
queue.enqueue(fourth3)
queue.printNodes() // returns 5 9 2 8
queue.count // returns 4
let de = queue.dequeue()
print(de?.value) // prints 5
queue.printNodes() // returns 9 2 8
queue.count // returns 3


// Implement a Stack using Linked List

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
stack.push(root4)
stack.push(second4)
stack.push(third4)
stack.push(fourth4)
stack.printNodes() // returns 5 9 2 8
let se = stack.pop()
print(se?.value) // prints 8
stack.printNodes() // returns 5 9 2

