/*
 * Insertion Sort
 */


var A = [5, 2, 4, 6, 1, 3]


// Iterative implementation.

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



// Recursive implementation.

func recursiveInsertionSort(inout a: [Int], count: Int) {
    if count == 1 {
        return
    } else {
        recursiveInsertionSort(&a, count: count - 1)
        let key = a[count - 1]
        var i = count - 2
        while i > -1 && key < a[i] {
            a[i + 1] = a[i]
            i -= 1
        }
        a[i + 1] = key
    }
}

recursiveInsertionSort(&A, count: A.count)