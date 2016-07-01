// Recursive Insertion Sort

var A = [4, 99, 87, 64, 23, 59, 12, 13]

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