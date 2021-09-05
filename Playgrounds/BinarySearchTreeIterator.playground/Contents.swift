// Author: John Ngoi
// Book: Interviewing in Swift:
// Algorithms and Data Structures:
// Your guide in helping you prepare for the real world of software engineering interviews as an iOS or Mac OS developer.
// Available on Amazon and Kindle! Search for "john ngoi" to find the book!
// ASIN: B01L8DY5H6
//
//    Implement the BSTIterator class that represents an iterator over the in-order traversal of a binary search tree (BST):
//
//    BSTIterator(TreeNode root) Initializes an object of the BSTIterator class. The root of the BST is given as part of the constructor. The pointer should be initialized to a non-existent number smaller than any element in the BST.
//    boolean hasNext() Returns true if there exists a number in the traversal to the right of the pointer, otherwise returns false.
//    int next() Moves the pointer to the right, then returns the number at the pointer.
//    Notice that by initializing the pointer to a non-existent smallest number, the first call to next() will return the smallest element in the BST.
//
//    You may assume that next() calls will always be valid. That is, there will be at least a next number in the in-order traversal when next() is called.
//
//
//    Example 1:
//
//    Input
//    ["BSTIterator", "next", "next", "hasNext", "next", "hasNext", "next", "hasNext", "next", "hasNext"]
//    [[[7, 3, 15, null, null, 9, 20]], [], [], [], [], [], [], [], [], []]
//    Output
//    [null, 3, 7, true, 9, true, 15, true, 20, false]
//
//    Explanation
//    BSTIterator bSTIterator = new BSTIterator([7, 3, 15, null, null, 9, 20]);
//    bSTIterator.next();    // return 3
//    bSTIterator.next();    // return 7
//    bSTIterator.hasNext(); // return True
//    bSTIterator.next();    // return 9
//    bSTIterator.hasNext(); // return True
//    bSTIterator.next();    // return 15
//    bSTIterator.hasNext(); // return True
//    bSTIterator.next();    // return 20
//    bSTIterator.hasNext(); // return False
//
//    Constraints:
//
//    The number of nodes in the tree is in the range [1, 105].
//    0 <= Node.val <= 106
//    At most 105 calls will be made to hasNext, and next.
//
//    Follow up:
//
//    Could you implement next() and hasNext() to run in average O(1) time and use O(h) memory, where h is the height of the tree?

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int) {
        self.val = val
    }
}

class BSTIterator {
    
    var queue = [TreeNode]()
    var root: TreeNode?

    init(_ root: TreeNode?) {
        self.root = root
        sort(self.root)
    }
    
    func sort(_ node: TreeNode?) {
        guard let node = node else { return }
        
        sort(node.left)
        queue.append(node)
        sort(node.right)
    }
    
    /** @return the next smallest number */
    func next() -> Int {
        if queue.count > 0 {
            let node = queue.removeFirst()
            return node.val
        }
        
        return Int.min
    }
    
    /** @return whether we have a next smallest number */
    func hasNext() -> Bool {
        if queue.count > 0 {
            return true
        }
        return false
    }
}

/**
 * Your BSTIterator object will be instantiated and called as such:
 * let obj = BSTIterator(root)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */


// faster implementation
class BSTIterator2 {

    init(_ root: TreeNode?) {
        inorder(root)
    }
    
    var array: [TreeNode] = []
    var index = 0
    
    func inorder(_ node: TreeNode?) {
        guard let node = node else { return }
        
        inorder(node.left)
        array.append(node)
        inorder(node.right)
    }
    
    func next() -> Int {
        if index < array.count {
            let node = array[index]
            index += 1
            return node.val
        }
        return -1
    }
    
    func hasNext() -> Bool {
        return index < (array.count) ? true : false
    }
}
