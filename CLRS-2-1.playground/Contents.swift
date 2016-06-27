//: Playground - noun: a place where people can play

import UIKit

var A = [5, 2, 4, 6, 1, 3]

/*
 * CLRS 2.1-2
 */

func insertionSortNonIncreasing(var array: [Int]) -> [Int] {
    for j in 1..<array.count {
        let key = array[j]
        var i = j - 1
        while i > -1 && array[i] < key {
            array[i + 1] = array[i]
            i = i - 1
        }
        array[i + 1] = key
    }
    return array
}


insertionSortNonIncreasing(A)



/*
 * CLRS 2.1-3
 */

func linearSearch(array: [Int], value: Int) -> Int?{
    for i in 0..<array.count {
        if array[i] == value {
            return i
        }
    }
    return nil
}

linearSearch(A, value: 3)

linearSearch(A, value: 7)



/*
 * CLRS 2.1-4
 */

// Binary digits represented as Big Endian integer arrays.
var B = [1,0,1,0]
var C = [0,1,1,1]

func addBinaryIntegers(augend: [Int], addend: [Int]) -> [Int]? {
    
    let numberOfDigits = augend.count
    if augend.count != addend.count {
        print("Arguments do not have the same length.")
        return nil
    }
    
    var carry = 0
    var sum = [Int](count: numberOfDigits + 1, repeatedValue: 0)
    for i in (0..<numberOfDigits).reverse() {
        sum[i + 1] = (augend[i] + addend[i] + carry) % 2
        carry = (augend[i] + addend[i] + carry) / 2
    }
    
    // Assign the carryout to MSB
    sum[0] = carry
    return sum
}

addBinaryIntegers(B, addend: C)

