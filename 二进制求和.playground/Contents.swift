
//给你两个二进制字符串，返回它们的和（用二进制表示）。
//
//输入为 非空 字符串且只包含数字 1 和 0。
//
//
//
//示例 1:
//
//输入: a = "11", b = "1"
//输出: "100"
//示例 2:
//
//输入: a = "1010", b = "1011"
//输出: "10101"

extension Int {
    func toIntList() -> [Int] {
        var tmp = self
        var list = [Int]()
        while tmp > 10 {
            let remaining = tmp % 10
//            list.append(remaining)
            list.insert(remaining, at: 0)
            tmp = (tmp - remaining)/10
        }
        list.insert(tmp, at: 0)
        return list
    }
}

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
//        let num_a = Int(a)
//        let num_b = Int(b)
//        let max = num_a! > num_b! ? num_a!:num_b!
//        for i in 0..<max {
//
//        }
        let max = max(a.count, b.count)
//         = num_a?.toIntList()
        return ""
    }
}

11.toIntList()
1100.toIntList()
