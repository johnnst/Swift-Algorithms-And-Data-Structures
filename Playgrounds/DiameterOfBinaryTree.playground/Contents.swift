/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        guard var root = root else { return 0 }
        var answer = 1
        
        func depth(_ node: TreeNode?) -> Int {
            guard var node = node else { return 0 }
            var left = depth(node.left)
            var right = depth(node.right)
            answer = max(answer, left + right + 1)
            return max(left, right) + 1
        }
        
        let _ = depth(root)
        return answer - 1
    }
}


/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var diameter = 0
        
        func longestPath(_ root: TreeNode?) -> Int {
            guard let root = root else { return 0 }
            
            var leftPath = longestPath(root.left)
            var rightPath = longestPath(root.right)
            
            diameter = max(diameter, (leftPath + rightPath))
            
            return max(leftPath, rightPath) + 1
        }
        
        longestPath(root)
        return diameter
    }
}

