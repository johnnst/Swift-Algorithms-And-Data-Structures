//Given an m x n binary matrix mat, return the length of the longest line of consecutive one in the matrix.
//
//The line could be horizontal, vertical, diagonal, or anti-diagonal.
//
//
//
//Example 1:
//
//
//Input: mat = [[0,1,1,0],[0,1,1,0],[0,0,0,1]]
//Output: 3
//Example 2:
//
//
//Input: mat = [[1,1,1,1],[0,1,1,0],[0,0,0,1]]
//Output: 4
//
//
//Constraints:
//
//m == mat.length
//n == mat[i].length
//1 <= m, n <= 104
//1 <= m * n <= 104
//mat[i][j] is either 0 or 1.
//
//

// SLOW
class Solution {
    func longestLine(_ mat: [[Int]]) -> Int {
        guard mat.count > 0, mat[0].count > 0 else { return 0 }
        
        func dfs(_ row: Int, _ col: Int, _ direction: [Int], _ length: Int) -> Int {
            // print("dfs, row: \(row), col: \(col)")
            let row = row + direction[0]
            let col = col + direction[1]
            if row >= 0 && col >= 0 && row < mat.count && col < mat[0].count {
                if mat[row][col] == 1 {
                    return dfs(row, col, direction, length+1)
                }
            }
            return length
        }
        
        var longest = 0
        
        for row in 0..<mat.count {
            for col in 0..<mat[row].count {
                if mat[row][col] == 1 {
                    // search lines
                    // print()
                    // print("searching")
                    
                    // print("down")
                    longest = max(longest, dfs(row, col, [1, 0], 1)) // down
                    // print("right")
                    longest = max(longest, dfs(row, col, [0, 1], 1)) // right
                    // print("diagonal down right")
                    longest = max(longest, dfs(row, col, [1, 1], 1)) // diagonal down right
                    // print("diagonal down left")
                    longest = max(longest, dfs(row, col, [1, -1], 1)) // diagonal down left
                }
            }
        }
        
        return longest
    }
}


// FASTER, using HASHMAPS

class Solution {
    func longestLine(_ M: [[Int]]) -> Int {
        var row: [Int: Int] = [:]
        var col: [Int: Int] = [:]
        var ad: [Int: Int] = [:]
        var dd: [Int: Int] = [:]
        var longest = 0
        
        for i in 0..<M.count {
            for j in 0..<(M[0].count) {
                if M[i][j] == 0 {
                    row[i] = 0
                    col[j] = 0
                    ad[j+i] = 0
                    dd[j-i] = 0
                } else {
                    row[i] = row[i, default: 0] + 1
                    col[j] = col[j, default: 0] + 1
                    ad[j+i] = ad[j+i, default: 0] + 1
                    dd[j-i] = dd[j-i, default: 0] + 1
                    longest = max(longest, row[i]!)
                    longest = max(longest, col[j]!)
                    longest = max(longest, ad[j+i]!)
                    longest = max(longest, dd[j-i]!)
                }
            }
        }
        return longest
    }
}
