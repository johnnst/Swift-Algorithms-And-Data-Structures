//Given two integers dividend and divisor, divide two integers without using multiplication, division, and mod operator.
//
//Return the quotient after dividing dividend by divisor.
//
//The integer division should truncate toward zero, which means losing its fractional part. For example, truncate(8.345) = 8 and truncate(-2.7335) = -2.
//
//Note: Assume we are dealing with an environment that could only store integers within the 32-bit signed integer range: [−231, 231 − 1]. For this problem, assume that your function returns 231 − 1 when the division result overflows.
//
//
//
//Example 1:
//
//Input: dividend = 10, divisor = 3
//Output: 3
//Explanation: 10/3 = truncate(3.33333..) = 3.
//Example 2:
//
//Input: dividend = 7, divisor = -3
//Output: -2
//Explanation: 7/-3 = truncate(-2.33333..) = -2.
//Example 3:
//
//Input: dividend = 0, divisor = 1
//Output: 0
//Example 4:
//
//Input: dividend = 1, divisor = 1
//Output: 1
//
//
//Constraints:
//
//-231 <= dividend, divisor <= 231 - 1
//divisor != 0
//
//


class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        var dividend = dividend, divisor = divisor
        
        // Int.max 9223372036854775807
        // Int.min -9223372036854775808
        let intMin = -2147483648
        let intMax = 2147483647
        let halfMin = -1073741824
        
        if dividend == intMin && divisor == -1 {
            return intMax
        }
        
        var negatives = 2
        if dividend > 0 {
            negatives -= 1
            dividend = -dividend
        }
        
        if divisor > 0 {
            negatives -= 1
            divisor = -divisor
        }
        
        var quotient = 0
        
        while divisor >= dividend {
            var powerOfTwo = -1
            var value = divisor
            
            while value >= halfMin && (value + value) >= dividend {
                value += value
                powerOfTwo += powerOfTwo
            }
            
            quotient += powerOfTwo
            
            dividend -= value
        }
        
        return negatives != 1 ? -quotient : quotient
    }
}
