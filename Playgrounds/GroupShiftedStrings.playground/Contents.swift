//We can shift a string by shifting each of its letters to its successive letter.
//
//For example, "abc" can be shifted to be "bcd".
//We can keep shifting the string to form a sequence.
//
//For example, we can keep shifting "abc" to form the sequence: "abc" -> "bcd" -> ... -> "xyz".
//Given an array of strings strings, group all strings[i] that belong to the same shifting sequence. You may return the answer in any order.
//
//
//
//Example 1:
//
//Input: strings = ["abc","bcd","acef","xyz","az","ba","a","z"]
//Output: [["acef"],["a","z"],["abc","bcd","xyz"],["az","ba"]]
//Example 2:
//
//Input: strings = ["a"]
//Output: [["a"]]
//
//
//Constraints:
//
//1 <= strings.length <= 200
//1 <= strings[i].length <= 50
//strings[i] consists of lowercase English letters.



class Solution {
    func groupStrings(_ strings: [String]) -> [[String]] {
        guard strings.count > 0 else { return [[]] }
        if strings.count == 1 { return [strings] }
        
        var mem: [String: [String]] = [:]
        
        for (i, str) in strings.enumerated() {
            // print()
            // print("str: \(str)")
            
            let length = str.count
            var key = "\(length),"
            
            if str.count == 1 {
                key = key + "0"
                if let array = mem[key] {
                    mem[key] = array + [str]
                } else {
                    mem[key] = [str]
                }
                continue
            }
            
            for (j, s) in str.enumerated() {
                if j > 0 {
                    // print(s)
                    let value = Int("\(s.asciiValue!)")!
                    // print("value: \(value)")
                    let prev = str[str.index(str.startIndex, offsetBy: (j-1))]
                    // print(prev)
                    let previousValue = Int("\(prev.asciiValue!)")!
                    // print("previousValue: \(previousValue)")
                    var diff = value - previousValue
                    if diff < 0 {
                        diff = 26 + diff
                    }
                    // print("diff: \(diff)")
                    key = key + "\(diff),"
                }
            }
            // print(key)
            
            if let array = mem[key] {
                mem[key] = array + [str]
            } else {
                mem[key] = [str]
            }
            // print(mem.values)
            
        }
        
        return Array(mem.values)
    }
}


// faster

class Solution {
    func groupStrings(_ strings: [String]) -> [[String]] {
        guard strings.count > 0 else { return [] }
        if strings.count == 1 { return [strings] }
        
        var dict: [String: [String]] = [:]
        
        for i in 0..<strings.count {
            let string = [Character](strings[i])
            let length = string.count
            var key = "\(length),"
            
            if string.count == 1 {
                key = key + "0"
                if let letters = dict[key] {
                    dict[key] = letters + [String(string)]
                } else {
                    dict[key] = [String(string)]
                }
                continue
            }
            
            for j in 1..<string.count {
                let value = Int(string[j].asciiValue!)
                let previousValue = Int(string[j-1].asciiValue!)
                
                var diff = value - previousValue
                if diff < 0 {
                    diff = 26 + diff
                }
                key = key + "\(diff),"
            }
            
            if let letters = dict[key] {
                dict[key] = letters + [String(string)]
            } else {
                dict[key] = [String(string)]
            }
        }
        
        
        return Array(dict.values)
    }
}

