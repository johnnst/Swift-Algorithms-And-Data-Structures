class Solution {
    func minRemoveToMakeValid(_ s: String) -> String {
        guard !s.isEmpty else { return s }
        
        var stack = [(position: Int, char: Character)]()
        
        var s = [Character](s)
        
        for (i, c) in s.enumerated() {
            if c == ")" {
                if stack.count == 0 {
                    stack.append((i, c))
                } else if let last = stack.last {
                    if last.char == "(" {
                        stack.popLast()
                    } else {
                        stack.append((i, c))
                    }
                }
            } else if c == "(" {
                stack.append((i, c))
            }
        }
        
        for (i, _) in stack.reversed() {
            s.remove(at: i)
        }
        
        return String(s)
    }
}

class Solution {
    func minRemoveToMakeValid(_ s: String) -> String {
        var s = [Character](s)
        
        var stack: [(Character, Int)] = [] // indexes to remove
        
        for i in (0..<s.count).reversed() {
            if s[i] == "(" {
                if let last = stack.last {
                    if last.0 == ")" {
                        stack.removeLast()
                    } else {
                        stack.append(("(", i))
                    }
                } else {
                    stack.append(("(", i))
                }

            } else if s[i] == ")" {
                stack.append((")", i))
            }
        }
        
        // deal with leftovers
        for i in 0..<stack.count {
            s.remove(at: stack[i].1)
        }
         
        return String(s)
    }
}
