//实现 pow(x, n) ，即计算 x 的 n 次幂函数。
//
//示例 1:
//
//输入: 2.00000, 10
//输出: 1024.00000
//示例 2:
//
//输入: 2.10000, 3
//输出: 9.26100
//示例 3:
//
//输入: 2.00000, -2
//输出: 0.25000
//解释: 2-2 = 1/22 = 1/4 = 0.25
//说明:
//
//-100.0 < x < 100.0
//n 是 32 位有符号整数，其数值范围是 [−231, 231 − 1] 。

class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if (n < 0) {
            return 1/myPow(x, -n)
        }
        else if (n == 0) {
            return 1
        }
        else if (n == 2) {
            return x * x
        }
        let remaining = n % 2
        if (remaining == 0) {
            let tmp = n/2
            let result = myPow(x, tmp)
            return result * result
        }
        else {
            let tmp = (n - 1)/2
            let result = myPow(x, tmp)
            return result * result * x
        }
    }
}

assert(Solution().myPow(2.00000, 10) == 1024)
assert(Solution().myPow(3, 3) == 27)
assert(Solution().myPow(2.00000, -2) == 0.25)

