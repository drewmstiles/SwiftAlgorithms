//: Playground - noun: a place where people can play

import UIKit

let DATA0 = [6, 7, 7, 7, 8, 8, 8, 9, 9, 10]

let DATA1 = [96, 104, 126, 134, 140]

func standardDeviation(of data: [Int]) -> Double {
    
    // Store length so it doesn't need to be accessed twice.
    let count = data.count
    
    // Average the array by reducing to sum of elements divided by count.
    let average = data.reduce(0) { $0 + $1 } / count
    
    // Sum the square of the distances between each element and the average.
    let sum = data.map({ pow(Double($0 - average), 2) }).reduce(0) { $0 + $1 }
    
    return sqrt(sum/Double(count))
}

standardDeviation(of: DATA0)

standardDeviation(of: DATA1)