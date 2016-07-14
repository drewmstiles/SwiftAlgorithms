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
    [19,20,21,22],
    [26,25,24,23]
]


func greedyAscentPeakFind(matrix: [[Int]], row: Int, col: Int) -> (Int, Int) {
   
    let element = (row, col)
    let largestNeighbor = getLargestNeighbor(matrix, row: element.0, col: element.1)
    
    if (matrix[element.0][element.1] >= matrix[largestNeighbor.0][largestNeighbor.1]) {
        return element
    }
    else {
        return greedyAscentPeakFind(matrix, row: largestNeighbor.0, col: largestNeighbor.1)
    }
}

func getLargestNeighbor(matrix: [[Int]], row: Int, col: Int) -> (Int, Int) {
    
    let indexOfBottom = row + 1
    let indexOfTop = row - 1
    let indexOfRight = col + 1
    let indexOfLeft = col - 1
    
    var topNeigbor = Int.min
    var rightNeigbor = Int.min
    var bottomNeigbor = Int.min
    var leftNeigbor = Int.min
    
    // Assigning values of neighbors.
    if row != 0 {
        topNeigbor = matrix[indexOfTop][col]
    }
    
    if col != matrix[0].count - 1 {
        rightNeigbor = matrix[row][indexOfRight]
    }

    if row != matrix.count - 1 {
        bottomNeigbor = matrix[indexOfBottom][col]
    }
    
    if col != 0 {
        leftNeigbor = matrix[row][indexOfLeft]
    }

    // Ordering the neighbors by value.
    var neighbors = [
        (indexOfTop, col, topNeigbor),
        (row, indexOfRight, rightNeigbor),
        (indexOfBottom, col, bottomNeigbor),
        (row, indexOfLeft, leftNeigbor)
    ]
    
    neighbors = neighbors.sort { $0.2 > $1.2 }

    return (neighbors[0].0, neighbors[0].1)
}


greedyAscentPeakFind(M, row: 0, col: 0)


