// Binary Search

var A = [1, 13, 23, 34, 45, 56, 67, 78, 89, 90]

func binarySearch(a: [Int], l: Int, r: Int, v: Int) -> Int? {
    if l > r {
        return nil
    }
    else {
        let mid = (l + r) / 2
        if (v == a[mid]) {
            return mid
        }
        else if v < a[mid] {
            return binarySearch(a, l: l, r: mid - 1, v: v)
        }
        else {
            return binarySearch(a, l: mid + 1, r: r, v: v)
        }
    }
}


binarySearch(A, l: 0, r: A.count - 1, v: 8)

binarySearch(A, l: 0, r: A.count - 1, v: 13)


