// Author: John Ngoi
// Book: Interviewing in Swift:
// Algorithms and Data Structures:
// Your guide in helping you prepare for the real world of software engineering interviews as an iOS or Mac OS developer.
// Available on Amazon and Kindle! Search for "john ngoi" to find the book!
// ASIN: B01L8DY5H6
//
// Binary Search Tree (BST)

/// Simple tree node class.
class TreeNode {
    var data: Int = 0
    var left: TreeNode?
    var right: TreeNode?
    
    init(data: Int) {
        self.data = data
    }
}

// Implement an insert function to create the BST.

/// Insert a node into a tree.
///
/// - Parameters:
///   - root: Tree root node.
///   - node: Node to be inserted.
func insert (root: TreeNode?, node: TreeNode) {
    // for more advance Swift programmers, you can start of with "if let else" pattern
    // this is more readable for general audience coming from other languages
    if root == nil {
        return
    } else {
        if let root = root {
            if root.data > node.data { // go left
                if root.left == nil {
                    root.left = node
                } else {
                    insert(root: root.left, node: node)
                }
            } else { // go right
                if root.right == nil {
                    root.right = node
                } else {
                    insert(root: root.right, node: node)
                }
            }
        }
    }
}

// Test the implementation of the BST.

/// Print the tree nodes in ascending order.
///
/// - Parameter root: Tree root node.
func printTreeInOrder (root: TreeNode?) {
    if root == nil {
        return
    }
    if let root = root {
        printTreeInOrder(root: root.left)
        print(root.data)
        printTreeInOrder(root: root.right)
    }
}

let root = TreeNode(data: 9)
insert(root: root, node: TreeNode(data: 7))
insert(root: root, node: TreeNode(data: 11))
insert(root: root, node: TreeNode(data: 5))
insert(root: root, node: TreeNode(data: 15))
insert(root: root, node: TreeNode(data: 21))
insert(root: root, node: TreeNode(data: 6))
printTreeInOrder(root: root)

