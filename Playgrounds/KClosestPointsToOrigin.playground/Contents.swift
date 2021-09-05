class Solution {
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        guard points.count > 0 else { return [] }
        
        func distance(_ point: [Int]) -> Double {
            guard point.count == 2 else { return 0.0 }
            
            // var x = NSDecimalNumber(decimal: pow((0 - point[0]), 2)).doubleValue  // Decimal to NSDecimalNumber to Double
            // var y = NSDecimalNumber(decimal: pow((0 - point[1]), 2)).doubleValue
            
            var x = Double(0) - Double(point[0])
            var y = Double(0) - Double(point[1])
            var x2 = x * x
            var y2 = y * y
            
            return (x2 + y2).squareRoot()
        }
        
        var indexes: [(Int, Double)] = []
        
        for (index, point) in points.enumerated() {
            let dist = distance(point)
            
            indexes.append((index, dist))
        }
        
        var sorted = indexes.sorted { $0.1 < $1.1 }
        var answer: [[Int]] = []
        for i in 0..<k {
            let index = sorted[i].0
            answer.append(points[index])
        }
        
        return answer
    }
}

