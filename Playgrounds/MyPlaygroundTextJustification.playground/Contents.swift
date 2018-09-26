// Author: John Ngoi
// Book: Interviewing in Swift:
// Algorithms and Data Structures:
// Your guide in helping you prepare for the real world of software engineering interviews as an iOS or Mac OS developer.
// Available on Amazon and Kindle! Search for "john ngoi" to find the book!
// ASIN: B01L8DY5H6
//
// Text justification
// Given a string of words and a max length, L, format the text such that each line has exactly L characters and is fully left and right justified.
// Restrictions:
// You need to fit as many words in every line.
// You are not allowed to split a word and put them in next line.
// Pad extra spaces if needed so that each line has L characters.
// Extra spaces between words should be distributed as evenly as possible.
// Example ...
// words = ["This", "is", "an", "example", "of", "text", "justification."]
// line length = 16
// result =
// ["This    is    an",
// "example  of text",
// "justification.  "]
//

func textJustification (words: [String], maxLength: Int) -> [String]? {
    var results = [String]() // store the results of each line

    if words.count == 0 || maxLength == 0 {
        return results
    }

    var lineCharacterCount = 0 // counter to keep track of number of characters per line
    var lineIndex = 0 // index tracker to start each new line from the words array

    for (i, word) in words.enumerated() {
        lineCharacterCount += word.count + 1
        if lineCharacterCount >= maxLength {
            let beginLineIndex = lineIndex
            let endLineIndex = i - 1
            lineIndex = i
            
            // find the leftover space
            let count = lineCharacterCount - (word.count + 2)
            
            lineCharacterCount = 0 // reset to ZERO
            lineCharacterCount += word.count + 1 // begin counting for the next line
            
            // calculate the leftover to fill with spaces
            var leftover = maxLength - count
            print("leftover = \(leftover)")

            // try to evenly distribute the spaces
            let numberOfGaps = endLineIndex - beginLineIndex
            print("numberOfGaps = \(numberOfGaps)")
            var extraSpaces = 0
            if numberOfGaps > 0 {
                extraSpaces = leftover / numberOfGaps
            }
            print("extraSpacesPerGap = \(extraSpaces)")
            leftover = leftover - (extraSpaces * numberOfGaps)
            print("leftover after = \(leftover)")
            
            // construct the line left and right justified
            var text = ""
            for word in words[beginLineIndex..<endLineIndex] {
                text.append(word)
                text.append(" ")
                if leftover > 0 {
                    leftover -= 1
                    text.append(" ")
                }
                let spaces = String(repeating: " ", count: extraSpaces)
                text.append(spaces)
            }
            text.append(words[endLineIndex])
            print("line text = \(text)")
            results.append(text)
        }
        
        // handle last line
        if i == words.endIndex - 1 {
            let beginLineIndex = lineIndex
            let endLineIndex = i
            
            var text = ""
            for word in words[beginLineIndex..<endLineIndex] {
                text.append(word)
                text.append(" ")
            }
            text.append(words[endLineIndex])
            results.append(text)
        }
    }
    return results
}

// let's test!
let test1 = ["This", "is", "an", "example", "of", "text", "justification."]
let result1 = textJustification(words: test1, maxLength: 16)
print(result1!)

let test2 = ["This", "is", "an", "example", "of", "text", "justification."]
let result2 = textJustification(words: test1, maxLength: 8)
print(result2!)

let test3 = ["This", "is", "an", "example", "of", "text", "justification."]
let result3 = textJustification(words: test1, maxLength: 20)
print(result3!)
