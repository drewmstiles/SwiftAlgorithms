/*
 * Algorithms for finding both 1D and 2D peaks.
 */

let A = [0, 1, 2, 3, 4, 5, 9, 7, 8, 6]

func naivePeakFind(array: [Int]) -> Int? {
    
    let first = 0
    let last = array.count - 1
    
    if array[first] >= array[first + 1] {
        return 0
    }
    else if array[last] >= array[last - 1] {
        return last
    }
    else {
        for i in 1..<(array.count - 1) {
            if array[i - 1] < array[i] && array[i + 1] < array[i] {
                return i
            }
        }
    }
    
    return nil
}


func binaryPeakFind(array: [Int], begin: Int, end: Int) -> Int? {
    
    let mid = (begin + end) / 2
    
    if mid == 0 {
        if array[0] >= array[1] {
            return 0
        }
        else {
            return nil
        }
    }
    else if mid == array.count - 1 {
        let n = array.count - 1
        if array[n] >= array[n - 1] {
            return n
        }
        else {
            return nil
        }
    }
    else if array[mid] < array[mid - 1] {
        return binaryPeakFind(array, begin: begin, end: mid - 1)
    }
    else if array[mid] < array[mid + 1] {
        return binaryPeakFind(array, begin: mid + 1, end: end)
    }
    else {
        return mid
    }
}

naivePeakFind(A)

binaryPeakFind(A, begin: 0, end: A.count - 1)



let M = [
    [11,12,13,14],
    [18,17,16,15],
    [19,27,28,29],
    [26,25,24,23]
]


func greedyAscentPeakFind(matrix: [[Int]], row: Int, col: Int) -> (Int, Int) {
   
    var isPeakRelativeToTop = false
    var isPeakRelativeToLeft = false
    var isPeakRelativeToBottom = false
    var isPeakRelativeToRight = false
    
    let indexOfBottom = row + 1
    let indexOfTop = row - 1
    let indexOfRight = col + 1
    let indexOfLeft = col - 1
    
    // Check top.
    if (row == 0) {
        isPeakRelativeToTop = true
    }
    else {
        isPeakRelativeToTop = matrix[row][col] >= matrix[indexOfTop][col]
    }
    
    // Check right.
    if (col == matrix[0].count - 1) {
        isPeakRelativeToRight = true
    }
    else {
        isPeakRelativeToRight = matrix[row][col] >= matrix[row][indexOfRight]
    }
    
    // Check bottom.
    if (row == matrix.count - 1) {
        isPeakRelativeToBottom = true
    }
    else {
        isPeakRelativeToBottom = matrix[row][col] >= matrix[indexOfBottom][col]
    }
    
    // Check left.
    if (col == 0) {
        isPeakRelativeToLeft = true
    }
    else {
        isPeakRelativeToLeft = matrix[row][col] >= matrix[row][indexOfLeft]
    }
    
    if (!isPeakRelativeToTop) {
        return greedyAscentPeakFind(matrix, row: indexOfTop, col: col)
    }
    else if !isPeakRelativeToRight {
        return greedyAscentPeakFind(matrix, row: row, col: indexOfRight)
    }
    else if !isPeakRelativeToBottom {
        return greedyAscentPeakFind(matrix, row: indexOfBottom, col: col)
    }
    else if !isPeakRelativeToLeft {
        return greedyAscentPeakFind(matrix, row: row, col: indexOfLeft)
    }
    else {
        return (row, col)
    }
}

greedyAscentPeakFind(M, row: 0, col: 0)


