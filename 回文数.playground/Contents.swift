//
//判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。
//
//示例 1:
//
//输入: 121
//输出: true
//示例 2:
//
//输入: -121
//输出: false
//解释: 从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。
//示例 3:
//
//输入: 10
//输出: false
//解释: 从右向左读, 为 01 。因此它不是一个回文数。

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        else if x == 0 {
            return true
        }
        var x_copy = x
        var reversed = 0
        while x_copy != 0 {
            let 余 = x_copy % 10
            reversed = reversed * 10 + 余
            x_copy = (x_copy - 余) / 10
        }
        return x == reversed
    }
}
assert(Solution().isPalindrome(121) == true)
assert(Solution().isPalindrome(-121) == false)
assert(Solution().isPalindrome(10) == false)
assert(Solution().isPalindrome(0) == true)
assert(Solution().isPalindrome(123) == false)
assert(Solution().isPalindrome(123454321) == true)
assert(Solution().isPalindrome(567898765) == true)
assert(Solution().isPalindrome(5678998765) == true)
assert(Solution().isPalindrome(5678798765) == false)
