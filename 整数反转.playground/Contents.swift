/// 给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。

class Solution {
    func reverse(_ x: Int) -> Int {
        var tmp = x
        var result = 0
        while tmp != 0 {
            let 余 = tmp % 10
            result = 10 * result + 余
            tmp = (tmp - 余)/10
        }
        if result > Int32.max || result < Int32.min {
            return 0
        }
        return result
    }
}

assert(Solution().reverse(-123) == -321)
assert(Solution().reverse(123) == 321)
assert(Solution().reverse(0) == 0)
assert(Solution().reverse(6326223623623) == 0)
