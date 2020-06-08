//给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
//
//示例 1:
//
//输入: "abcabcbb"
//输出: 3
//解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
//示例 2:
//
//输入: "bbbbb"
//输出: 1
//解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
//示例 3:
//
//输入: "pwwkew"
//输出: 3
//解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
//     请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        // 将字符串转变为数组
        var arr: [Character] = []
        for char in s {
            arr.append(char)
        }

        // 滑动窗口,上面为目前的窗口
        var currentQueue: [Character] = []
        var maxQueue: [Character] = []

        for (_, char) in arr.enumerated() {
            //将queue删到没有当前char。
            while currentQueue.contains(char) {
                currentQueue.removeFirst()
            }

            currentQueue.append(char)
            print(currentQueue)
            
            if currentQueue.count > maxQueue.count {
                maxQueue = currentQueue
            }
        }


        return maxQueue.count
    }
}


assert(Solution().lengthOfLongestSubstring("abcabcbb") == 3)
assert(Solution().lengthOfLongestSubstring("bbbbb") == 1)
assert(Solution().lengthOfLongestSubstring("pwwkew") == 3)
//"abc".hasDuplicate()
//"aa".hasDuplicate()
Solution().lengthOfLongestSubstring("hdgikkinyyzxycsekxoev")
