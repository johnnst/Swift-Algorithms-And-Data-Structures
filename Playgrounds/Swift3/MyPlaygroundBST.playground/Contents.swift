//
// John Ngoi
// Swift 3
// BST
//

class Node <T: Comparable> {
    var value: T
    var left: Node?
    var right: Node?
    
    init(value: T) {
        self.value = value
    }
}

class Tree <T: Comparable> {
    var root: Node<T>?
    
    func insert (node: Node<T>) {
        guard let root = self.root else {
            self.root = node
            return
        }
        
        insert(root: root, node: node)
    }
    
    private func insert (root: Node<T>, node: Node<T>) {
        
        if node.value < root.value { // go left
            if let left = root.left {
                insert(root: left, node: node)
            } else {
                root.left = node
            }
        } else { // go right
            if let right = root.right {
                insert(root: right , node: node)
            } else {
                root.right = node
            }
        }
    }
    
    func printTree() {
        printTreeInOrder(node: self.root)
    }
    
    private func printTreeInOrder (node: Node<T>?) {
        if node == nil {
            return
        }
        
        if let node = node {
            printTreeInOrder(node: node.left)
            print(node.value)
            printTreeInOrder(node: node.right)
        }
    }
}

let node1 = Node(value: 5)
let node2 = Node(value: 2)
let node3 = Node(value: 9)
let node4 = Node(value: 8)

let tree = Tree <Int> ()
//tree.printTree()
tree.insert(node: node1)
//tree.printTree()
tree.insert(node: node2)
tree.insert(node: node3)
tree.insert(node: node4)
tree.printTree()




