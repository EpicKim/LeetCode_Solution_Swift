
class Queen {
    var row = Int()
    var column = Int()
    required init(_ row:Int, _ column:Int) {
        self.row = row
        self.column = column
    }
}

func 是否对角线(_ a:Queen, _ b:Queen) -> Bool {
    let tmp = a * 2
    return (tmp - 1) == b || (tmp + 1) == b;
}

func foo(_ column:Int, _ n:Int,_ queens:[Queen]) -> [Queen] {
    if (column == n) {
        return queens;
    }
    else if (column == 0) {
        for i in 0..<column {
            let list = [Queen(i, 0)]
            let result = foo(column + 1, n, list)
            if (result.count == n) {
                return result
            }
        }
    }
    else {
        for i in 0..<n {
            for j in queens {
                if (j.row != i && ) {
                    
                }
            }
        }
    }
}

class Solution {
//    func solveNQueens(_ n: Int) -> [[String]] {
//
//    }
}
