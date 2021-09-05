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
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let root = root else { return 0 }
        
        var sum = 0
        
        func preorder(_ root: TreeNode?) {
            guard let root = root else { return }
            
            if root.val >= low && root.val <= high {
                sum += root.val
            }
            
            preorder(root.left)
            preorder(root.right)
        }
        
        preorder(root)
        return sum
    }
}
