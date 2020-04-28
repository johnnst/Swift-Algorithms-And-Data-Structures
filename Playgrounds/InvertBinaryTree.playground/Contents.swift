// Author: John Ngoi
// Book: Interviewing in Swift:
// Algorithms and Data Structures:
// Your guide in helping you prepare for the real world of software engineering interviews as an iOS or Mac OS developer.
// Available on Amazon and Kindle! Search for "john ngoi" to find the book!
// ASIN: B01L8DY5H6
//
// Invert Binary Tree
//
// Given a binary tree, invert the binary tree including all sub trees.
//
// Swift 5.2.2

class Node {
    var value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int) {
        self.value = value
    }
    
    class func insert(value: Int, root: Node) {
        var queue = [Node]()
        queue.append(root)
        
        while !queue.isEmpty {
            let node = queue.removeFirst() // dequeue
            if let left = node.left {
                queue.append(left)
            } else {
                node.left = Node(value: value)
                break
            }
            
            if let right = node.right {
                queue.append(right)
            } else {
                node.right = Node(value: value)
                break
            }
        }
    }
    
    class func printInOrder(root: Node) {
        if let left = root.left {
            printInOrder(root: left)
        }
        print(root.value)
        if let right = root.right {
            printInOrder(root: right)
        }
    }
}

// Let's test!
let root1 = Node(value: 7)
Node.insert(value: 9, root: root1)
Node.insert(value: 11, root: root1)
Node.insert(value: 1, root: root1)
Node.insert(value: 2, root: root1)
Node.insert(value: 3, root: root1)
Node.insert(value: 8, root: root1)
Node.printInOrder(root: root1)

// Strategy
// This is all about your pointer skills!
// Simply swap the left and right child nodes.
// Then recursively travel left, and right, and swapping their left and right children.
//
// Time O(n)
// Space O(h), height of tree


//class Node {
//    var value: Int
//    var left: Node?
//    var right: Node?
//
//    init(value: Int) {
//        self.value = value
//    }
//}

func invertBinaryTree(_ root: Node?) {
    guard let root = root else { return }
    
    let left = root.left
    root.left = root.right
    root.right = left
    
    invertBinaryTree(root.left)
    invertBinaryTree(root.right)
}

print()
invertBinaryTree(root1)
Node.printInOrder(root: root1)

