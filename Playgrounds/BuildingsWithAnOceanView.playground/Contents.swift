class Solution {
    func findBuildings(_ heights: [Int]) -> [Int] {
        guard heights.count > 0 else { return [] }
        if heights.count == 1 { return [0] }
        
        var tallestIndex = heights.count - 1
        var answer: [Int] = [tallestIndex]
        
        for index in (0..<(heights.count - 1)).reversed() {
            // print("index: \(index)  height: \(heights[index])  tallest: \(heights[tallestIndex])")
            if heights[index] > heights[tallestIndex] {
                answer.append(index)
                tallestIndex = index
            }
        }
        
        return answer.reversed()
    }
}


// faster with while loop in reverse

class Solution {
    func findBuildings(_ heights: [Int]) -> [Int] {
        guard heights.count > 0 else { return [] }
        if heights.count == 1 { return [0] }
        
        var tallestIndex = heights.count - 1
        var answer: [Int] = [tallestIndex]
        
        var i = tallestIndex - 1
        while i >= 0 {
            if heights[i] > heights[tallestIndex] {
                tallestIndex = i
                answer.append(tallestIndex)
            }
            
            i -= 1
        }
        
        return answer.reversed()
    }
}

