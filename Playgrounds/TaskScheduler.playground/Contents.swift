class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        
        var frequencies = Array(repeating: 0, count: 26)
        let a: Character = "A"
        
        for t in tasks {
            let aValue = Int("\(a.asciiValue!)")!
            // print(aValue)
            let tValue = Int("\(t.asciiValue!)")!
            // print(tValue)
            let diff = tValue - aValue
            frequencies[diff] += 1
        }
        
        var fMax = frequencies.max()! // O(n)
        // print(fMax)
        
        var nMax = frequencies.indices.filter { frequencies[$0] == fMax } // O(n)
        // print(nMax)
        
        return max(tasks.count, (fMax - 1) * (n + 1) + nMax.count)
    }
}

// faster below

class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        guard tasks.count > 0 else { return 0 }
        if tasks.count == 1 { return 1 }
        
        // greedy
        
        var frequencies = Array(repeating: 0, count: 26)
        for t in tasks {
            frequencies[(Int(t.asciiValue!) - Int(Character("A").asciiValue!))] += 1
        }
    
        frequencies.sort()
        
        var maxFrequency = frequencies.removeLast()
        var idleTime = (maxFrequency - 1) * n
        
        while !frequencies.isEmpty && idleTime > 0 {
            idleTime -= min((maxFrequency - 1), frequencies.removeLast())
        }
        
        idleTime = max(0, idleTime)
        
        return idleTime + tasks.count
    }
}
