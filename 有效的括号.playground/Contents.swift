//给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。
//
//有效字符串需满足：
//
//左括号必须用相同类型的右括号闭合。
//左括号必须以正确的顺序闭合。
//注意空字符串可被认为是有效字符串。
//
//示例 1:
//
//输入: "()"
//输出: true
//示例 2:
//
//输入: "()[]{}"
//输出: true
//示例 3:
//
//输入: "(]"
//输出: false
//示例 4:
//
//输入: "([)]"
//输出: false
//示例 5:
//
//输入: "{[]}"
//输出: true

class Solution {
    func isValid(_ s: String) -> Bool {
        let left = ["(","[","{"]
        let right = [")","]","}"]
        var map = [String:String]()
        for i in 0..<left.count {
            map[left[i]] = right[i]
        }
        if (s.count % 2 != 0) {
            return false
        }
        var a = Array<String>()
        var succcss = true;
        s.forEach { (character) in
            let tmp = String(character)
            if (left.contains(tmp)) {
                
                a.append(tmp)
            }
            else if (right.contains(tmp)) {
                let last = a.last
                if (a.last == nil) {
                    succcss = false
                }
                else if (map[last!] == tmp) {
                    a = a.dropLast()
                }
                else {
                    succcss = false
                }
            }

        }
        return succcss && a.count == 0
    }
}

assert(Solution().isValid("{[]}") == true)
assert(Solution().isValid("{]}") == false)
assert(Solution().isValid("{}()[]") == true)
assert(Solution().isValid("{}()[{}]") == true)
assert(Solution().isValid("{}()[{]]") == false)
assert(Solution().isValid("{{") == false)
assert(Solution().isValid("){") == false)
