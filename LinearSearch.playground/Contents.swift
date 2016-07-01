/*
 * Linear Search
 */
var A = [5, 2, 4, 6, 1, 3]

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
