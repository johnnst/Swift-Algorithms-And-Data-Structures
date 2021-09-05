// Author: John Ngoi
// Book: Interviewing in Swift:
// Algorithms and Data Structures:
// Your guide in helping you prepare for the real world of software engineering interviews as an iOS or Mac OS developer.
// Available on Amazon and Kindle! Search for "john ngoi" to find the book!
// ASIN: B01L8DY5H6
//
//    Given the root of a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.
//
//    Example 1:
//
//    Input: root = [1,2,3,null,5,null,4]
//    Output: [1,3,4]
//    Example 2:
//
//    Input: root = [1,null,3]
//    Output: [1,3]
//    Example 3:
//
//    Input: root = []
//    Output: []
//
//    Constraints:
//
//    The number of nodes in the tree is in the range [0, 100].
//    -100 <= Node.val <= 100

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int) {
        self.val = val
    }
}

class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        
        // rightmost value at depth, depth: node.val
        var hash = [Int: Int]()
        var maxDepth = -1
        
        var stack = [(node: TreeNode?, depth: Int)]()
        stack.append((node: root, depth: 0))
        
        while !stack.isEmpty {
            let (node, depth) = stack.removeLast()
            
            if let node = node {
                // maintain knowledge of the number of levels in the tree
                maxDepth = max(maxDepth, depth)
                
                // only insert into hash if depth is not already present
                if hash[depth] == nil {
                    hash[depth] = node.val
                }
                
                stack.append((node: node.left, depth: depth+1))
                stack.append((node: node.right, depth: depth+1))
            }
            
        }
        
        var results = [Int]()
        for depth in 0...maxDepth {
            if let d = hash[depth]{
                results.append(d)
            }
        }
        return results
        
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
class Solution2 {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        
        var answer: [Int] = []
        
        func traverse(_ node: TreeNode?, _ index: Int) {
            guard let node = node else { return }
            
            if index >= answer.count {
                answer.append(node.val)
            }
            
            traverse(node.right, index + 1)
            traverse(node.left, index + 1)
        }
        
        traverse(root, 0)
        return answer
    }
}

