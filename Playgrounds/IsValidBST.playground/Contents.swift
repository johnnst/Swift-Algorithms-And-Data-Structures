// Author: John Ngoi
// Book: Interviewing in Swift:
// Algorithms and Data Structures:
// Your guide in helping you prepare for the real world of software engineering interviews as an iOS or Mac OS developer.
// Available on Amazon and Kindle! Search for "john ngoi" to find the book!
// ASIN: B01L8DY5H6
//
// Swift 5.2.2
//
// Given a binary tree, determine if it is a valid binary search tree (BST).
//
// Assume a BST is defined as follows:
//
// The left subtree of a node contains only nodes with keys less than the node's key.
// The right subtree of a node contains only nodes with keys greater than the node's key.
// Both the left and right subtrees must also be binary search trees.
//
// Strategy
// We can simply perform a tree traversal for each and every node.
// Then compare the left and right values to satisfy the BST conditions.
// As you continue to traverse to the subtrees, you will need to set new upper or lower bound limits to ensure the subtrees satisfy the BST conditions.
// Time O(n), all nodes are visited and evaluated
// Space O(n), the queue takes up n extra space

class Node {
    var val: Int
    var left: Node?
    var right: Node?
    
    init(_ value: Int) {
        val = value
    }
}

class Tree {
    var root: Node
    init(_ value: Int) {
        root = Node(value)
    }
    
    func insert(_ value: Int) {
        var queue = [Node]()
        queue.append(root)
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            
            if node.left == nil {
                node.left = Node(value)
                return
            } else {
                queue.append(node.left!)
            }
            
            if node.right == nil {
                node.right = Node(value)
                return
            } else {
                queue.append(node.right!)
            }
        }
    }
}


func isValidBST(_ root: Node?) -> Bool {
    guard let root = root else { return true }
    
    func helper(_ node: Node?, _ lower: Int = Int.min, _ upper: Int = Int.max) -> Bool {
        guard let node = node else { return true }
        if node.val <= lower {
            return false
        }
        
        if node.val >= upper {
            return false
        }
        
        if !helper(node.left, lower, node.val) {
            return false
        }
        
        if !helper(node.right, node.val, upper) {
            return false
        }
        
        return true
    }
    
    return helper(root)
}


let tree1 = Tree(10)
tree1.insert(8)
tree1.insert(15)
tree1.insert(3)
tree1.insert(9)
tree1.insert(13)
tree1.insert(16)
print("tree1 results")
print(isValidBST(tree1.root))

let tree2 = Tree(10)
tree2.insert(9)
tree2.insert(15)
tree2.insert(3)
tree2.insert(11)
tree2.insert(13)
tree2.insert(16)
print("tree2 results")
print(isValidBST(tree2.root))

let tree3 = Tree(10)
print("tree3 results")
print(isValidBST(tree3.root))


