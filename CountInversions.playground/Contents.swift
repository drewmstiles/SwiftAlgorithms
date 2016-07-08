/*
 * An modified version of Merge Sort that counts the inversions
 * in an array in theta(nlgn) time.
 *
 * The algorithm modifies the merge between arrays counting the number
 * of inversions by calculating the size of the left array each time
 * the first element in the right array is greater than the first element
 * in the left array. Since the arrays are sorted using Merge Sort, this
 * occurence accounts for a number of inversions equal to the size of the
 * left array.
 */

var A = [2, 3, 8, 6, 1]

var B = [5, 4, 3, 2, 1]

func mergeCountingInversions(inout A: [Int], p: Int, q: Int, r: Int) -> Int{
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
    var inversions = 0
    while i < L.count && j < R.count {
        if L[i] <= R[j] {
            A[k] = L[i]
            i += 1
        }
        else {
            A[k] = R[j]
            j += 1
            // Modification to count inversions between left and right arrays.
            let numberOfElementsOnLeft = L.count - i
            inversions += numberOfElementsOnLeft
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
    
    return inversions
}


func countInversions(inout A: [Int], p: Int, r: Int) -> Int {
    if p < r {
        let q = (p + r) / 2
        let inversionsOnLeft = countInversions(&A, p: p, r: q)
        let inversionsOnRight = countInversions(&A, p: q + 1, r: r)
        let inversionsFoundInMerge = mergeCountingInversions(&A, p: p, q: q, r: r)
        return (inversionsOnLeft + inversionsOnRight + inversionsFoundInMerge)
    }
    else {
        return 0
    }
}

countInversions(&A, p: 0, r: A.count - 1)

countInversions(&B, p: 0, r: B.count - 1)

