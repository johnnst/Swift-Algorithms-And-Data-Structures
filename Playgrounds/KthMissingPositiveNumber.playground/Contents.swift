class Solution {
    func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
        
        var left = 0
        var right = arr.count - 1
        
        while left <= right {
            var pivot = left + (right - left) / 2
            // print()
            // print("left: \(left)")
            // print("right: \(right)")
            // print("pivot: \(pivot)")
            
            if (arr[pivot] - pivot - 1) < k {
                left = pivot + 1
                // print("update left: \(left)")
            } else {
                right = pivot - 1
                // print("update right: \(right)")
            }
        }
        
        return left + k
    }
}

// slower

class Solution {
    func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
        guard arr.count > 0 else { return 0 }
        
        var k = k
        var left = 0
        for (index, num) in arr.enumerated() {
            let diff = num - left - 1  // diff = 2 - 0 - 1 = 1
            if diff > 0 {              // true
                if k > diff {          // true
                    k -= diff          // k = 5 - 1 = 4
                } else {
                    left += k
                    return left
                }
            }
            
            left = num
        }
        
        // leftovers
        if k > 0 {
            left += k
        }
        
        return left
    }
}
