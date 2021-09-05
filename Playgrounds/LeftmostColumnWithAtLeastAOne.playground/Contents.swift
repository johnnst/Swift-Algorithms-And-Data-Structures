/**
 * // This is the BinaryMatrix's API interface.
 * // You should not implement it, or speculate about its implementation
 * public class BinaryMatrix {
 *     public func get(_ row: Int, _ col: Int) -> Int {}
 *     public func dimensions() -> [Int] {}
 * };
 */

class Solution {
    func leftMostColumnWithOne(_ binaryMatrix: BinaryMatrix) -> Int {
        let dimensions = binaryMatrix.dimensions()
        var rows = dimensions[0]
        var columns = dimensions[1]
        
        var answer = -1
        var right = columns
        
        for r in 0..<rows {
            for c in (0..<right).reversed() {
                // print()
                // print("r: \(r)")
                // print("c: \(c)")
                if binaryMatrix.get(r, c) == 1 {
                    
                    answer = c
                    right = c
                } else {
                    break
                }
            }
        }
        return answer
    }
}

// above is faster


/**
 * // This is the BinaryMatrix's API interface.
 * // You should not implement it, or speculate about its implementation
 * public class BinaryMatrix {
 *     public func get(_ row: Int, _ col: Int) -> Int {}
 *     public func dimensions() -> [Int] {}
 * };
 */

class Solution {
    func leftMostColumnWithOne(_ binaryMatrix: BinaryMatrix) -> Int {
        let row = binaryMatrix.dimensions()[0]
        let column = binaryMatrix.dimensions()[1]
        
        // print("row: \(row), col: \(column)")
        var answer = -1
        var j = column - 1
        for i in 0..<row {
            // print()
            while j >= 0 {
                // print(binaryMatrix.get(i, j))
                if binaryMatrix.get(i, j) == 0 {
                    break
                } else {
                    answer = j
                }
                
                j -= 1
            }
        }
        return answer
    }
}


