
 public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init(_ val: Int) {
         self.val = val
         self.left = nil
         self.right = nil
     }
}

func foo(_ node:TreeNode, _ current:Int, _ sum:Int, _ list:[Int]) -> [Int]? {
//    print(list)
    let tmp = node.val + current
    var tmpList = list
    tmpList.append(node.val)
//
//    print(tmp)
//    print(tmpList)
    
    if (tmp == sum && node.left == nil && node.right == nil) {
        return tmpList
    }

//    print(list)
    if (node.left != nil) {
        
        let leftResult = foo(node.left!, tmp, sum, tmpList)
        if (leftResult != nil) {
            return leftResult
        }
    }
    if (node.right != nil) {
        let rightResult = foo(node.right!, tmp, sum, tmpList)
        if (rightResult != nil) {
            return rightResult
        }
    }
    return nil
}

class Solution {
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        if (root == nil) {
            return false
        }
        let r = foo(root!, 0, sum, [])
        if (r != nil) {
            return true
        }
        else {
            return false
        }
    }
}


//              5
//             / \
//            4   8
//           /   / \
//          11  13  4
//         /  \      \
//        7    2      1

let five = TreeNode(5)
five.left = TreeNode(4)
five.right = TreeNode(8)
five.left?.left = TreeNode(11)
five.left?.left?.left = TreeNode(7)
five.left?.left?.right = TreeNode(2)
five.right?.left = TreeNode(13)
five.right?.right = TreeNode(4)
five.right?.right?.right = TreeNode(1)
Solution().hasPathSum(five, 28)
