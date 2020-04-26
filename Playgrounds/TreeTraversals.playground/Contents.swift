// Author: John Ngoi
// Book: Interviewing in Swift:
// Algorithms and Data Structures:
// Your guide in helping you prepare for the real world of software engineering interviews as an iOS or Mac OS developer.
// Available on Amazon and Kindle! Search for "john ngoi" to find the book!
// ASIN: B01L8DY5H6
//
// Tree Traversals


// Tree Node
class Node {
    var value: Int
    var left: Node?
    var right: Node?
    
    init(_ value: Int) {
        self.value = value
    }
}

class BinaryTree {
    var root: Node
    
    init(_ node: Node) {
        root = node
    }
    
    // Brain teaser: What type of tree traversal is used here to create a balanced BT?
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
                queue.append((node.right!))
            }
        }
    }
    
    func printInorder(_ node: Node?) {
        guard let node = node else { return }
        
        printInorder(node.left)
        print(node.value)
        printInorder(node.right)
    }
    
    func printPreorder(_ node: Node?) {
        guard let node = node else { return }
        
        print(node.value)
        printPreorder(node.left)
        printPreorder(node.right)
    }
    
    func printPostorder(_ node: Node?) {
        guard let node = node else { return }
        
        printPostorder(node.left)
        printPostorder(node.right)
        print(node.value)
    }
    
    func printLevelOrder() {
        var queue = [Node]()
        queue.append(root)
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            print(node.value)
            if let left = node.left {
                queue.append(left)
            }
            
            if let right = node.right {
                queue.append(right)
            }
        }
    }
}

let root = Node(9)
let tree1 = BinaryTree(root)
tree1.insert(10)
tree1.insert(11)
tree1.insert(1)
tree1.insert(2)
tree1.insert(3)
tree1.insert(8)
tree1.insert(13)

print("Printing Inorder")
tree1.printInorder(tree1.root)

print("Printing Preorder")
tree1.printPreorder(tree1.root)

print("Printing Postorder")
tree1.printPostorder(tree1.root)

print("Printing Level Order")
tree1.printLevelOrder()

