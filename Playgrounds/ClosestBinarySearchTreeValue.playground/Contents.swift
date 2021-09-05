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
    func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
        var lowestDiff = Double.greatestFiniteMagnitude
        var closestValue = 0
        
        func preorder(_ root: TreeNode?) {
            guard let root = root else { return }
            
            let diff = abs(target - Double(root.val))
            
            if diff < lowestDiff {
                lowestDiff = diff
                closestValue = root.val
            }
            
            preorder(root.left)
            preorder(root.right)
        }
        
        preorder(root)
        return closestValue
    }
}

// faster???

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
    func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
        guard let root = root else { return 0 }
        
        var distance: Double = Double.greatestFiniteMagnitude
        var answer = root.val
        
        func traverse(_ node: TreeNode?) {
            guard let node = node else { return }
            
            let diff = abs(Double(node.val) - target)
            if diff < distance {
                distance = diff
                answer = node.val
            }
            
            traverse(node.left)
            traverse(node.right)
        }
        
        traverse(root)
        return answer
    }
}

