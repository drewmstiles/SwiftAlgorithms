/*
 * Bubble Sort
 */

var A = [3, 4, 2, 1, 5, 8, 7, 9, 6, 0]

func bubbleSort(inout A: [Int]) {
    for i in 0..<(A.count - 1) {
        for j in ((i + 1)..<A.count).reverse() {
            if A[j] < A[j - 1] {
                let temp = A[j]
                A[j] = A[j - 1]
                A[j - 1] = temp
            }
        }
    }
}

bubbleSort(&A)


