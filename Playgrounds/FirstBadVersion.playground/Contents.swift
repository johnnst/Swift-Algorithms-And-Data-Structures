/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) -> Bool{}
 */

class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        
        var left = 1
        var right = n
        
        while left < right {
            var mid = left + (right - left) / 2
            if isBadVersion(mid) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        
        return left
    }
}

// slower

/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) -> Bool{}
 */

class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        if n == 1 { return n }
        var pivot = n / 2 + 1
        var left = 1
        var right = n
        
        // 5 / 2 + 1 = 3
        
        var badVersion = n
        
        while left <= right {
            // print()
            // print("pivot \(pivot)")
            // print("left: \(left)  right: \(right)")
            if isBadVersion(pivot) {
                badVersion = pivot
                right = pivot - 1
                
            } else {
                left = pivot + 1
                
                // 5 - 3 / 2 + 3 = 4
            }
            
            pivot = (right - left) / 2 + left
            
        }
        
        return badVersion
    }
}
