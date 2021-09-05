class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        var dict: [Character: Int] = [:]
        
        for c in s {
            if let value = dict[c] {
                dict[c] = value + 1
            } else {
                dict[c] = 1
            }
        }
        
        for c in t {
            if let value = dict[c] {
                if value == 1 {
                    dict[c] = nil
                } else {
                    dict[c] = value - 1
                }
            } else {
                return false
            }
        }
        return true
    }
}
