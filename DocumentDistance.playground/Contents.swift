/*
 * An implementation of the algorithm for computing the similarity between documents 
 * based on the angle (in radians) between their word frequency vectors. 
 *
 * Adapted to Swift from a Python implementation presented in the set of solutions from 
 * Lecture 2 of the MIT course "Introduction to Algorithms".
 */
 

import Foundation

var L1 = "It was the best of times"
var L2 = "It was the worst of times"
var L3 = "The quick brown fox"
var L4 = "Jumped over the lazy brown dog"

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

func innerProduct(vector1: [String : Int], and vector2: [String : Int])  -> Double {
    
    var sum = 0.0
    
    for key in vector1.keys {
        if let value2 = vector2[key] {
            sum += Double(vector1[key]! * value2)
        }
    }
    
    return sum
}

func calculateAngleBetweenVectors(v1: [String : Int], and v2: [String : Int])  -> Double {
    let numerator = innerProduct(v1, and: v2)
    let denominater = sqrt(innerProduct(v1, and: v1) * innerProduct(v2, and: v2))
    return acos(numerator/denominater)
}

func calculateDistanceBetween(line1: String, and line2: String) -> Double {
    let wordHash1 = getWordFrequencies(for: line1)
    let wordHash2 = getWordFrequencies(for: line2)
    let distance = calculateAngleBetweenVectors(wordHash1, and: wordHash2)
    return distance // in radians
}

calculateDistanceBetween(L1, and: L2)

calculateDistanceBetween(L3, and: L4)

calculateDistanceBetween(L1, and: L1)
