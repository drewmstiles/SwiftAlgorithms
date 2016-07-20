/*
 * An algorithm for computing the similarity between documents based on the angle
 * between their word frequency vectors.
 */
 

import Foundation

var L1 = "It was the best of times"
var L2 = "It was the worst of times"

func getWordFrequencies(for line: String) -> [String : Int] {
    
    var dict = [String : Int]()
    
    let tokens = line.componentsSeparatedByString(" ")
    for token in tokens {
        if let count = dict[token] {
            dict[token] = count + 1
        }
        else {
            dict[token] = 1
        }
    }
    
    return dict
}


func calculateDistanceBetween(line1: String, and line2: String) {
    let wordList1 = getWordFrequencies(for: line1)
//    let wordList2 = getWordFrequencies(for: line2)
    for (word, count) in wordList1 {
        print("Word: \(word), Count: \(count)");
    }
}

calculateDistanceBetween(L1, and: L2)

