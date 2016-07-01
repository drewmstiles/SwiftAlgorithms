/*
 * Insertion Sort
 */

var A = [5, 2, 4, 6, 1, 3]

func insertionSortNonIncreasing(inout array: [Int]) -> [Int] {
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

insertionSortNonIncreasing(&A)
