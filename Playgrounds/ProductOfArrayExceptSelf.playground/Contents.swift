class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else { return [] }
        
        var output = [Int]()
        output.append(1)
        
        for i in 1..<nums.count {
            output.append((nums[i-1] * output[i-1]))
        }
        
        var r = 1
        
        for i in (0..<(nums.count - 1)).reversed() {
            r = r * nums[i+1]
            output[i] = output[i] * r
        }
        return output
    }
}

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        guard nums.count > 0 else { return [] }
        if nums.count == 1 { return [0] }
        
        var answer: [Int] = [1]
        
        for i in 1..<nums.count {
            answer.append(nums[i-1] * answer[i-1])
        }
        // print(answer)
        
        // [1, 2, 3, 4]
        // [1, 1, 2, 6]
        

        
        var r = 1
        for i in (0..<nums.count).reversed() {
            answer[i] = answer[i] * r
            r *= nums[i]
        }
        
        // [24 , 12, 8, 6]
        return answer
    }
}

