/*
 * An algorithm for finding a pair with given sum in an array.
 */


var A = [8, 22, 13, 55, 3, 98, 72, 34, 90, 2]


// Secondary functions.

func merge(inout A: [Int], p: Int, q: Int, r: Int) {
    let n1 = q - p + 1
    let n2 = r - q
    var L = [Int](count: n1, repeatedValue: 0)
    var  R = [Int](count: n2, repeatedValue: 0)
    
    for i in 0..<n1 {
        L[i] = A[p + i]
    }
    
    for j in 0..<n2 {
        R[j] = A[q + j + 1]
    }
    
    var i = 0
    var j = 0
    var k = p
    while i < L.count && j < R.count {
        if L[i] <= R[j] {
            A[k] = L[i]
            i += 1
        }
        else {
            A[k] = R[j]
            j += 1
        }
        k += 1
    }
    
    if i >= L.count {
        for j in j..<R.count {
            A[k] = R[j]
            k += 1
        }
    }
    else {
        for i in i..<L.count {
            A[k] = L[i]
            k += 1
        }
    }
}


func mergeSort(inout A: [Int], p: Int, r: Int) {
    if p < r {
        let q = (p + r) / 2
        mergeSort(&A, p: p, r: q)
        mergeSort(&A, p: q + 1, r: r)
        merge(&A, p: p, q: q, r: r)
    }
}


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


// Primary function.

func findPairWithSum(inout a: [Int], x: Int) -> (Int, Int)? {
    mergeSort(&a, p: 0, r: a.count - 1)
    
    for i in 0..<a.count {
        let y = a[i]
        let z = x - y
        if binarySearch(a, l: 0, r: a.count, v: z) != nil {
            return (y, z)
        }
    }
    
    return nil
}

findPairWithSum(&A, x: 30)

findPairWithSum(&A, x: 13)
