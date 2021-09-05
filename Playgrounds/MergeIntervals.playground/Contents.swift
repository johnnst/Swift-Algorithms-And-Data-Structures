class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard !intervals.isEmpty else { return [] }
        
        let startTimes = intervals.sorted { $0[0] < $1[0] }
        
        var results = [[Int]]()
        
        for interval in startTimes {
            
            if results.isEmpty || results[results.count - 1][1] < interval[0] {
                results.append(interval)
            } else {
                results[results.count - 1][1] = max(results[results.count - 1][1], interval[1])
            }
        }
        
        
        return results
    }
}


class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard intervals.count > 0 else { return [[]] }
        
        if intervals.count == 1 { return intervals }
        
        let intervals = intervals.sorted { $0[0] < $1[0] }

        var answer: [[Int]] = []
        var interval = intervals[0]
        
        for i in 1..<intervals.count {
            if intervals[i][0] <= interval[1] {
                interval[1] = max(intervals[i][1], interval[1])
            } else {
                answer.append(interval)
                interval = intervals[i]
            }
        }
        
        answer.append(interval)
        
        return answer
    }
}

