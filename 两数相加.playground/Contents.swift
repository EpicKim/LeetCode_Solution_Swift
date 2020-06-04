//
//给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
//
//如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
//
//您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
//
//示例：
//
//输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
//输出：7 -> 0 -> 8
//原因：342 + 465 = 807
//import Foundation

 public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
          self.val = val
          self.next = nil
      }
}

func pow(_ result:Int,_ num:Int, _ time:Int) -> Int {
//    print(result)
    if (time == 0) {
        return 1
    }
    if (time <= 1) {
        return result
    }
    let newNum = result * num
    let newTime = time - 1
    return pow(newNum,num, newTime)
}

func getNumList(_ node:ListNode?, _ list:[Int]) -> [Int] {
    if (node == nil) {
        return list
    }
    var list_copy = list
    list_copy.append(node!.val)
    return getNumList(node?.next, list_copy)
}

func setupNode(_ node:ListNode?, _ list:[Int]) -> ListNode? {
    if (list.count == 0) {
        return node
    }
    if (node == nil) {
        return setupNode(ListNode(list[0]), Array(list.dropFirst()))
    }
    else {
        var tmp = node
        while tmp?.next != nil {
            tmp = tmp?.next
        }
        tmp?.next = ListNode(list[0])
        return setupNode(node, Array(list.dropFirst()))
    }
}

func getSum(_ list:[Int]) -> Int {
    var r = 0;
    for i in 0..<list.count {
        let tmp = pow(10,10, i)
        r += list[i] * tmp
    }
//    print(r)
    return r
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let a1 = getNumList(l1, [])
        let a2 = getNumList(l2, [])
        
        print(a1)
        print(a2)
        
        let n1 = getSum(a1)
        let n2 = getSum(a2)
        
        print(n1)
        print(n2)
        
        var sum = n1 + n2
        
        var a3 = Array<Int>()
        
        if (sum == 0) {
            a3 = [0]
        }
        else {
            while sum != 0 {
                let remaining = sum % 10
                sum = sum/10
                a3.append(remaining)
            }
        }
        return setupNode(nil, a3)
    }
}

func printNode(_ node:ListNode?) {
    if (node == nil) {
        return
    }
    print(node!.val)
    print("-")
    return printNode(node?.next)
    
}


var l1 = ListNode(2)
l1.next = ListNode(4)
l1.next?.next = ListNode(3)

var l2 = ListNode(5)
l2.next = ListNode(6)
l2.next?.next = ListNode(4)
//
//getNumList(l1, [])
//getNumList(l2, [])
//var result = Solution().addTwoNumbers(l1, l2)
var result = Solution().addTwoNumbers(ListNode(0), ListNode(0))
printNode(result!)
//print(result?.val)
//print(result?.next?.val)
//print(result?.next?.next?.val)

print(pow(10, 10, 4))
