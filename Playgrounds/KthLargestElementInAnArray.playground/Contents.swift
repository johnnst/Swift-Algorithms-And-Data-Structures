class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        guard !nums.isEmpty && k <= nums.count else { return 0 }
        
        let nums = nums.sorted()
        return nums[(nums.count - k)]
    }
}
