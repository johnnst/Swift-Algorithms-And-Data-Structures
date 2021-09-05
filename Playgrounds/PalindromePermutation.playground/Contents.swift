class Solution {
    func canPermutePalindrome(_ s: String) -> Bool {
        guard s.count > 0 else { return true }
        if s.count == 1 { return true }
        
//         var dict: [Character: Int] = [:]
        
//         for c in s {
//             if let m = dict[c] {
//                 dict[c] = nil
//             } else {
//                 dict[c] = 1
//             }
//         }
        
        var set = Set<Character>()
        
        for c in s {
            if set.contains(c) {
                set.remove(c)
            } else {
                set.insert(c)
            }
        }
        
        let mod = s.count % 2
        
        if mod == set.count {
            return true
        }
        return false
    }
}


class Solution {
    func canPermutePalindrome(_ s: String) -> Bool {
        guard s.count > 1 else { return true }
        var s = [Character](s)
        var set = Set<Character>()
        
        for c in s {
            if set.contains(c) {
                set.remove(c)
            } else {
                set.insert(c)
            }
        }
        
        if set.count == 1 || set.count == 0 {
            return true
        }
        
        return false
    }
}


// super fast
// Time: O(log n)
// Space: O(n)

class Solution {
    func canPermutePalindrome(_ s: String) -> Bool {
        guard s.count > 1 else { return true }
        var s = [Character](s)
        
//         var dict: [Character: Int] = [:]
        
//         for c in s {
//             if let m = dict[c] {
//                 dict[c] = nil
//             } else {
//                 dict[c] = 1
//             }
//         }
        
        var set = Set<Character>()
        var i = 0
        var j = s.count - 1
        
        while i <= j {
            // print()
            // print("i: \(i), j: \(j)")
            
            defer {
                // print("hi")
                i += 1
                j -= 1
            }
            
            if s[i] == s[j] && i != j {
                i += 1
                j -= 1
                continue
            }
            
            if set.contains(s[i]) {
                set.remove(s[i])
            } else {
                set.insert(s[i])
            }
            
            if i == j {
                break
            }
            
            if set.contains(s[j]) {
                set.remove(s[j])
            } else {
                set.insert(s[j])
            }
            
            // i += 1
            // j -= 1
        }
        
        if set.count == 1 || set.count == 0 {
            return true
        }
        
        return false
        
        // for c in s {
        //     if set.contains(c) {
        //         set.remove(c)
        //     } else {
        //         set.insert(c)
        //     }
        // }
        
//         let mod = s.count % 2
        
//         if mod == set.count {
//             return true
//         }
//         return false
    }
}
