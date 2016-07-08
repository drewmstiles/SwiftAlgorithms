/*
 * Horner's Rule for calculating polynomials.
 */

 // x^4 + x^3 + x^2 + x + 1
let c1 = [1, 1, 1, 1, 1]

// 3x^4 + 5x^3 + 7x^2 + 9x + 11
let c2 = [3, 5, 7, 9, 11]

func hornersRule(coefficients: [Int], x: Int) -> Int {
    var sum = 0;
    for i in (0..<coefficients.count).reverse() {
        sum = coefficients[i] + (x * sum)
    }
    return sum
}

hornersRule(c1, x: 1)

hornersRule(c2, x: 1)

func naivePolynomial (coefficients: [Int], x: Int) -> Int{
    var sum = 0
    sum = 0
    for i in 0..<coefficients.count {
        var xn = 1
        for _ in 0..<i {
            xn *= x
        }
        sum += coefficients[i] * xn
    }
    return sum
}

naivePolynomial(c1, x: 1)

naivePolynomial(c2, x: 1)