// Author: John Ngoi
// Book: Interviewing in Swift:
// Algorithms and Data Structures:
// Your guide in helping you prepare for the real world of software engineering interviews as an iOS or Mac OS developer.
// Available on Amazon and Kindle! Search for "john ngoi" to find the book!
// ASIN: B01L8DY5H6
//
// Numpad
//
// List all possible combinations from a numpad input
//
// The numpad has the following number to letter association
//
// Begin numpad
//     1    2    3
//         abc  def
//     4    5    6
//    ghi  jkl  mno
//     7    8    9
//   pqrs  tuv  wxyz
//          0
//
// End numpad
//
// For example
// text = "3", output = ["d", "e", "f"]
// text = "35", output = ["dj", "dk", "dl", "ej", "ek", "el", "fj", "fk", "fl"]
// text = "3412", putput = ["dga", "dgb", "dgc", "dha", "dhb", "dhc", "dia", "dib", "dic", "ega", "egb", "egc", "eha", "ehb", "ehc", "eia", "eib", "eic", "fga", "fgb", "fgc", "fha", "fhb", "fhc", "fia", "fib", "fic"]

// Strategy
// Sometimes it helps to simualte the outputs from inputs of varying lengths (n)
// Notice a pattern?
// One way to establish a relationship between one number to the next is a graph like structure
// Let's take "23"
// We can build the graph like so
// 2a -> 3d, 2a -> 3e, 2a -> 3f
// 2b -> 3d, 2b -> 3e, 2b -> 3f
// 2c -> 3d, 2c -> 3e, 2c -> 3f
// Try drawing out the output of "237", what does it look like?
// Now that we know this can be solved using a graph type algorithm, the most efficient way to traverse all possible nodes is using DFS (recursively)
// Other sub problem to solve is the access time for each number to letters.
// here, we can simply create a Dictionary with the numbers (keys) associated with an array of letters (values).
//
// Time O(nk), n is the length of the string, k is the max possible letters for each number
// Space O(nk)
// Swift 5.2.2


func numpad(_ text: String) -> [String] {
    guard !text.isEmpty else { return [] }
    
    let numpad: [Character: [Character]] = [
        "1": [],
        "2": ["a", "b", "c"],
        "3": ["d", "e", "f"],
        "4": ["g", "h", "i"],
        "5": ["j", "k", "l"],
        "6": ["m", "n", "o"],
        "7": ["p", "q", "r", "s"],
        "8": ["t", "u", "v"],
        "9": ["w", "x", "y", "z"],
        "0": []
    ]
    
    var results = [String]()
    
    func helper(_ i: Int, prefix: String) {
        if i == text.count {
            results.append(prefix)
            return
        }
        
        let char = text[text.index(text.startIndex, offsetBy: i)]

        if let chars = numpad[char] {
            if chars.count == 0 {
                helper(i + 1, prefix: prefix)
            } else {
                for c in chars {
                    helper(i + 1, prefix: prefix + String(c))
                }
            }
        } else {
            results.append("invalid num!")
            return
        }
    }

    helper(0, prefix: "")
    
    return results
}
print(numpad("3")) // ["d", "e", "f"]
print(numpad("34"))  // ["dg", "dh", "di", "eg", "eh", "ei", "fg", "fh", "fi"]
print(numpad("3412")) // ["dga", "dgb", "dgc", "dha", "dhb", "dhc", "dia", "dib", "dic", "ega", "egb", "egc", "eha", "ehb", "ehc", "eia", "eib", "eic", "fga", "fgb", "fgc", "fha", "fhb", "fhc", "fia", "fib", "fic"]
print(numpad("341209")) // ["dgaw", "dgax", "dgay", "dgaz", "dgbw", "dgbx", "dgby", "dgbz", "dgcw", "dgcx", "dgcy", "dgcz", "dhaw", "dhax", "dhay", "dhaz", "dhbw", "dhbx", "dhby", "dhbz", "dhcw", "dhcx", "dhcy", "dhcz", "diaw", "diax", "diay", "diaz", "dibw", "dibx", "diby", "dibz", "dicw", "dicx", "dicy", "dicz", "egaw", "egax", "egay", "egaz", "egbw", "egbx", "egby", "egbz", "egcw", "egcx", "egcy", "egcz", "ehaw", "ehax", "ehay", "ehaz", "ehbw", "ehbx", "ehby", "ehbz", "ehcw", "ehcx", "ehcy", "ehcz", "eiaw", "eiax", "eiay", "eiaz", "eibw", "eibx", "eiby", "eibz", "eicw", "eicx", "eicy", "eicz", "fgaw", "fgax", "fgay", "fgaz", "fgbw", "fgbx", "fgby", "fgbz", "fgcw", "fgcx", "fgcy", "fgcz", "fhaw", "fhax", "fhay", "fhaz", "fhbw", "fhbx", "fhby", "fhbz", "fhcw", "fhcx", "fhcy", "fhcz", "fiaw", "fiax", "fiay", "fiaz", "fibw", "fibx", "fiby", "fibz", "ficw", "ficx", "ficy", "ficz"]
