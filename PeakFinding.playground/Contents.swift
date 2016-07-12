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
