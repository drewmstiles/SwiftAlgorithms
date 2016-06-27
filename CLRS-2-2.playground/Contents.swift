//: Playground - noun: a place where people can play

import UIKit

var A = [3, 6, 2, 1, 9, 7]

/*
 * CLRS 2.2-2
 */

func selectionSort(arg: [Int]) -> [Int] {
    var array = arg
    for i in 0 ..< array.count - 1 {
        var smallest = i
        for j in (i + 1) ..< array.count {
            if (array[smallest] > array[j]) {
                smallest = j
            }
        }
        swap(&array, index: i, swapIndex: smallest)
    }
    return array
}

func swap(inout array: [Int], index: Int, swapIndex: Int) {
    let temp = array[index]
    array[index] = array[swapIndex]
    array[swapIndex] = temp
}


selectionSort(A)