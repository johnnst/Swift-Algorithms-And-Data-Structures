class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        
        var hash = [Int: Int]()  // sum, number of times
        hash[0] = 1 // number of times 0 seen
        
        var count = 0
        var sum = 0
        
        for i in 0..<nums.count {
            sum += nums[i]
            
            if let h = hash[(sum - k)] {
                count += h
            }
            
            if let h = hash[sum] {
                hash[sum] = h + 1
            } else {
                hash[sum] = 1
            }
        }
        
        return count
    }
}
