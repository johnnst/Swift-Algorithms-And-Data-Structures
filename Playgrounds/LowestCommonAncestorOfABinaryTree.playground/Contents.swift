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
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard var root = root, var p = p, var q = q else { return nil }
        
        var ancestor: TreeNode?
        
        func recurse(_ node: TreeNode?) -> Int {
            guard var node = node else { return 0 }
            
            let left = recurse(node.left)
            let right = recurse(node.right)
            
            let mid = (node.val == p.val || node.val == q.val) ? 1 : 0
            
            if (mid + left + right) >= 2 {
                ancestor = node
            }
            
            return max(mid, left, right)
        }
        
        let _ = recurse(root)
        return ancestor
    }
}
