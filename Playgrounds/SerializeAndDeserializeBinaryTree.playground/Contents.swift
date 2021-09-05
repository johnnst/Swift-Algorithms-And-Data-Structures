//Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.
//
//Design an algorithm to serialize and deserialize a binary tree. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that a binary tree can be serialized to a string and this string can be deserialized to the original tree structure.
//
//Clarification: The input/output format is the same as how LeetCode serializes a binary tree. You do not necessarily need to follow this format, so please be creative and come up with different approaches yourself.
//
//
//
//Example 1:
//
//
//Input: root = [1,2,3,null,null,4,5]
//Output: [1,2,3,null,null,4,5]
//Example 2:
//
//Input: root = []
//Output: []
//Example 3:
//
//Input: root = [1]
//Output: [1]
//Example 4:
//
//Input: root = [1,2]
//Output: [1,2]
//
//
//Constraints:
//
//The number of nodes in the tree is in the range [0, 104].
//-1000 <= Node.val <= 1000
//
//


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

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        var result = ""
        
        func rserialize(_ root: TreeNode?) {
            guard let root = root else {
                result += "None,"
                return
            }
            
            result += "\(root.val),"
            rserialize(root.left)
            rserialize(root.right)
        }
        
        rserialize(root)
        // print(result)
        return result
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        guard data.count > 0 else { return nil }
        
        var parts = data.components(separatedBy: ",")
        if parts.last! == "" {
            parts.removeLast()
        }
        
//        print(parts)
        
        func rdeserialize() -> TreeNode? {
            // print(parts)
            guard parts.count > 0 else {
                return nil
            }
            
            let value = parts.removeFirst()
            if value == "None" {
                return nil
            }

            let num = Int(value)!
            var newNode = TreeNode(num)
            // print("created new node \(num)")

            newNode.left = rdeserialize()
            newNode.right = rdeserialize()
            return newNode
        }
        
        return rdeserialize()
    }
}

// Your Codec object will be instantiated and called as such:
// var ser = Codec()
// var deser = Codec()
// deser.deserialize(ser.serialize(root))
