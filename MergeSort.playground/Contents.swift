//: Playground - noun: a place where people can play

import UIKit

var A = [3, 41, 52, 26, 38, 57, 9, 49]

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

func insertionSort(inout a: [Int], begin: Int, end: Int) {
    let count = end - begin
    if count == 0 {
        return
    } else {
        insertionSort(&a, begin: begin + 1, end: end)
        let key = a[count - 1]
        var i = count - 2
        while i > -1 && key < a[i] {
            a[i + 1] = a[i]
            i -= 1
        }
        a[i + 1] = key
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

func mixedSort(inout A: [Int], p: Int, r: Int, k: Int) {
    if p >= r {
        return
    }
    else if r - p < k {
        insertionSort(&A, begin: p, end: r)
    }
    else {
        let q = (p + r) / 2
        mixedSort(&A, p: p, r: q, k: k)
        mixedSort(&A, p: q + 1, r: r, k: k)
        merge(&A, p: p, q: q, r: r)
    }
}


mergeSort(&A, p: 0, r: A.count - 1)

mixedSort(&A, p: 0, r: A.count - 1, k: 3)


