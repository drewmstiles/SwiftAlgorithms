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
    [14,13,17,28],
    [15,29,11,17],
    [16,17,19,20]
]


func greedyAscentPeakFind(matrix: [[Int]], row: Int, col: Int) -> (Int, Int) {
   
    let maxRowInColumn = findLocalMaxRowInColumn(matrix, row: row, col: col)
    let maxColumnInRow = findLocalMaxColumnInRow(matrix, row: row, col: col)
    
    if maxColumnInRow == col && maxRowInColumn == row {
        return (row, col)
    }
    else {
       return greedyAscentPeakFind(matrix, row: maxRowInColumn, col: maxColumnInRow)
    }
}

func findLocalMaxColumnInRow(matrix: [[Int]], row: Int, col: Int ) -> Int {
    let begin = 0
    let end = matrix[row].count - 1
    
    if col == begin {
        if matrix[row][begin] >= matrix[row][begin + 1] {
            return begin
        }
        else {
            for c in 1..<(end - 1) {
                if matrix[row][c] >= matrix[row][c + 1] {
                    return c
                }
            }
            
            // Loop fall through means largest row was last.
            return end
        }
    }
    else if col == end {
        if matrix[row][end] >= matrix[row][end - 1] {
            return end
        }
        else {
            for c in (1..<(end - 1)).reverse() {
                if matrix[row][c] >= matrix[row ][c - 1] {
                    return c
                }
            }
            
            // Loop fall through means largest row was first.
            return begin
        }
    }
    else {
        if matrix[row][col] < matrix[row][col + 1] {
            for c in col..<(end - 1) {
                if matrix[row][c] >= matrix[row][c + 1] {
                    return c
                }
            }
            
            // Loop fall through means largest row was last.
            return end
        }
        else if matrix[row][col] < matrix[row][col - 1] {
            for c in (1..<(col - 1)).reverse() {
                if matrix[row][c] >= matrix[row][c - 1] {
                    return c
                }
            }
            
            // Loop fall through means largest row was first.
            return begin
        }
        else {
            return col
        }
    }
}

func findLocalMaxRowInColumn(matrix: [[Int]], row: Int, col: Int ) -> Int {
    let begin = 0
    let end = matrix.count - 1
    
    if row == begin {
        if matrix[begin][col] >= matrix[begin + 1][col] {
            return begin
        }
        else {
            for r in 1..<(end - 1) {
                if matrix[r][col] >= matrix[r + 1][col] {
                    return r
                }
            }
            
            // Loop fall through means largest row was last.
            return end
        }
    }
    else if row == end {
        if matrix[end][col] >= matrix[end - 1][col] {
            return end
        }
        else {
            for r in (1..<(end - 1)).reverse() {
                if matrix[r][col] >= matrix[r - 1][col] {
                    return r
                }
            }
            
            // Loop fall through means largest row was first.
            return begin
        }
    }
    else {
        if matrix[row][col] < matrix[row + 1][col] {
            for r in row..<(end - 1) {
                if matrix[r][col] >= matrix[r + 1][col] {
                    return r
                }
            }
            
            // Loop fall through means largest row was last.
            return end
        }
        else if matrix[row][col] < matrix[row - 1][col] {
            for r in (1..<(row)).reverse() {
                if matrix[r][col] >= matrix[r - 1][col] {
                    return r
                }
            }
            
            // Loop fall through means largest row was first.
            return begin
        }
        else {
            return row
        }
    }
}

greedyAscentPeakFind(M, row: M.count/2, col: M[0].count/2)


