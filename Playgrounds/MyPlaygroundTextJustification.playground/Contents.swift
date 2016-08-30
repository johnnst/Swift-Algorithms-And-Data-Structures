// John Ngoi
// Text justification
// Given a string of words and a max length, L, format the text such that each line has exactly L characters and is fully left and right justified.
// Example ...
// words = ["This", "is", "an", "example", "of", "text", "justification."]
// line length = 16
// result =
// ["This    is    an",
// "example  of text",
// "justification.  "]
// 
//

import UIKit

func textJustification (words: [String], maxLength: Int) -> [String]? {
    var results = [String]() // store the results of each line
    
    if words.count == 0 || maxLength == 0 {
        return results
    }
    
    var count = 0 // counter to keep track of total words length per line
    var lineIndex = 0 // index tracker to start each new line from the words array
    
    for (i, word) in words.enumerate() {
        count = count + word.characters.count
        // when we hit over the maxLength
        if count + i - lineIndex > maxLength {
            let wordsLength = count - word.characters.count
            let spaceLength = maxLength - wordsLength
            var eachLength = 1
            var extraLength = 0
            
            let spaces = i - lineIndex - 1 // calculate the number of spaces
            if spaces > 0 {
                eachLength = spaceLength / spaces // calculate the number of spaces per space
                extraLength = spaceLength % spaces // calculate the remainder space to distribute
            }
            
            // start constructing the line and adding the words and spaces
            var line = ""
            
            for k in lineIndex ..< i - 1 {
                line += words[k]
                
                // add the number of spaces per space
                var ce = 0
                while ce < eachLength {
                    line += " "
                    ce += 1
                }
                
                // distribute the extra spaces
                if extraLength > 0 {
                    line += " "
                    extraLength -= 1
                }
            }
            
            line += words[i - 1] // don't forget the last word in the line
            
            while line.characters.count < maxLength {
                line += " "
            }
            
            results.append(line)
            
            lineIndex = i // set the start of the new lineIndex
            count = words[i].characters.count
        }
    }
    
    // handle the last line
    var line = ""
    
    for i in lineIndex ..< words.count - 1 {
        count = count + words[i].characters.count
        line += words[i] + " "
    }
    
    line += words.last!
    while line.characters.count < maxLength {
        line += " "
    }
    
    results.append(line)
    return results
}

// let's test!
let test1 = ["This", "is", "an", "example", "of", "text", "justification."]
let result = textJustification(test1, maxLength: 16)
