/*
 * Binary Integer Addition
 */

// Binary digits represented as Big Endian integer arrays.
var B = [1,0,1,0]
var C = [0,1,1,1]

func binaryIntegerAddition(augend: [Int], addend: [Int]) -> [Int]? {
    
    let numberOfDigits = augend.count
    if augend.count != addend.count {
        print("Arguments do not have the same length.")
        return nil
    }
    
    var carry = 0
    var sum = [Int](count: numberOfDigits + 1, repeatedValue: 0)
    for i in (0..<numberOfDigits).reverse() {
        sum[i + 1] = (augend[i] + addend[i] + carry) % 2
        carry = (augend[i] + addend[i] + carry) / 2
    }
    
    // Assign the carryout to MSB
    sum[0] = carry
    return sum
}

binaryIntegerAddition(B, addend: C)