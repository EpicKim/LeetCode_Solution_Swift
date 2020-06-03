//编写一个函数来查找字符串数组中的最长公共前缀。
//
//如果不存在公共前缀，返回空字符串 ""。
//
//示例 1:
//
//输入: ["flower","flow","flight"]
//输出: "fl"
//示例 2:
//
//输入: ["dog","racecar","car"]
//输出: ""
//解释: 输入不存在公共前缀。

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if (strs.count == 0) {
            return ""
        }
        let first = strs.first!
        for i in 0...first.count {
            let length = first.count - i
            let prefix = first.prefix(length)
            let tmpArray = strs.dropFirst()
            let filtered = tmpArray.filter { (str) -> Bool in
                return str.hasPrefix(prefix)
            }
            if (filtered.count == tmpArray.count) {
                return String(prefix)
            }
        }
        
        return ""
    }
}

assert(Solution().longestCommonPrefix(["flower","flow","flight"]) == "fl")
assert(Solution().longestCommonPrefix(["dog","racecar","car"]) == "")
assert(Solution().longestCommonPrefix(["dog","dogweg","dh"]) == "d")
