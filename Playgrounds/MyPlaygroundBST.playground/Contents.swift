// John Ngoi
// Binary Search Tree (BST)

// tree node
class TreeNode {
    var data: Int = 0
    var left: TreeNode?
    var right: TreeNode?
    
    init(data: Int) {
        self.data = data
    }
}

// insert functin to help build the BST
func insert (root: TreeNode?, node: TreeNode) {
    // for more advance Swift programmers, you can start of with "if let else" pattern
    // this is more readable for general audience
    if root == nil {
        return
    } else {
        if let root = root {
            if root.data > node.data { // go left
                if root.left == nil {
                    root.left = node
                } else {
                    insert(root.left, node: node)
                }
            } else { // go right
                if root.right == nil {
                    root.right = node
                } else {
                    insert(root.right, node: node)
                }
            }
        }
    }
}

// to test the BST
func printTreeInOrder (root: TreeNode?) {
    if root == nil {
        return
    }
    if let root = root {
        printTreeInOrder(root.left)
        print(root.data)
        printTreeInOrder(root.right)
    }
}

let root = TreeNode(data: 9)
insert(root, node: TreeNode(data: 7))
insert(root, node: TreeNode(data: 11))
insert(root, node: TreeNode(data: 5))
insert(root, node: TreeNode(data: 15))
insert(root, node: TreeNode(data: 21))
insert(root, node: TreeNode(data: 6))
printTreeInOrder(root)

