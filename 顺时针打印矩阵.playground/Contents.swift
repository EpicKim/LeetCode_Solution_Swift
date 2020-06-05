//
//输入一个矩阵，按照从外向里以顺时针的顺序依次打印出每一个数字。
//
//
//
//示例 1：
//
//输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
//输出：[1,2,3,6,9,8,7,4,5]
//示例 2：
//
//输入：matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
//输出：[1,2,3,4,8,12,11,10,9,5,6,7]
//
//
//限制：
//
//0 <= matrix.length <= 100
//0 <= matrix[i].length <= 100

func 搞定外圈(_ matrix:[[Int]], _ result:[Int]) -> [Int] {
    var m = matrix
    var r = result
    if (matrix.count == 0) {
        return result
    }
    if (matrix.count == 1) {
        r += matrix[0]
        return r
    }
    let 矩阵第一行 = m.remove(at: 0)
    r += 矩阵第一行
    if (m.count == 0) {
        return r
    }
    for i in 0..<m.count {
        r.append(m[i].removeLast())
        
    }
    if (m[0].count == 0) {
        return r
    }
    r += m.removeLast().reversed()
    if (m.count == 0) {
        return r
    }
    for i in 0..<m.count {
        r.append(m[m.count - i - 1].removeFirst())
    }
    if (m[0].count == 0) {
        return r
    }
    return 搞定外圈(m, r)
}

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        return 搞定外圈(matrix, [])
    }
}

assert(Solution().spiralOrder([[1,2,3],[4,5,6],[7,8,9]]) == [1,2,3,6,9,8,7,4,5])
assert(Solution().spiralOrder([[1,2,3,4],[5,6,7,8],[9,10,11,12]]) == [1,2,3,4,8,12,11,10,9,5,6,7])
assert(Solution().spiralOrder([[1],[1],[1]]) == [1,1,1])
assert(Solution().spiralOrder([[1]]) == [1])

assert(Solution().spiralOrder([[1,11],[2,12],[3,13],[4,14],[5,15],[6,16],[7,17],[8,18],[9,19],[10,20]]) == [1, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 10, 9, 8, 7, 6, 5, 4, 3, 2])
assert(Solution().spiralOrder([[1,2],[3,4]]) == [1,2,4,3])
