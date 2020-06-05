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

func format(_ list:[Int], _ index:Int) -> [Int] {
    if (index == list.count) {
        return list + [1]
    }
    var new = list
    new[index] += 1
    if (new[index] >= 10) {
        new[index] -= 10
        return format(new, index + 1)
    }
    else {
        return new
    }
}
//4 3 2 1 21
func addTwoArray(_ a1:[Int], _ a2:[Int]) -> [Int] {
    let minCount = min(a1.count, a2.count)
    var new1 = a1, new2 = a2

    var result = [Int]()
    var needAddOne = false
    for i in 0..<minCount {
        var tmp = new1[i] + new2[i]
        if (needAddOne) {
            tmp += 1
            needAddOne = false
        }
        if (tmp > 9) {
            tmp -= 10
            needAddOne = true
        }
        result.append(tmp)
    }
//    print(result)
    if (a1.count > a2.count) {
        var arr = Array(new1[minCount...(new1.count - 1)])
        if (needAddOne) {
            arr = format(arr, 0)
        }
        result = result + arr
    }
    else if (a2.count > a1.count) {
        var arr = Array(new2[minCount...(new2.count - 1)])
        if (needAddOne) {
            arr = format(arr, 0)
        }
        result = result + arr
    }
    // equal
    else {
        if (needAddOne) {
            result.append(1)
        }
    }
//    result.reverse()
    return result
}

func getNumList(_ node:ListNode?, _ list:[Int]) -> [Int] {
    if (node == nil) {
        return list
    }
    var list_copy = list
    list_copy.append(node!.val)
    return getNumList(node?.next, list_copy)
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let a1 = getNumList(l1, [])
        let a2 = getNumList(l2, [])
        
        print(a1)
        print(a2)

        let a3 = addTwoArray(a1, a2)

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


//var l1 = ListNode(2)
//l1.next = ListNode(4)
//l1.next?.next = ListNode(3)
//
//var l2 = ListNode(5)
//l2.next = ListNode(6)
//l2.next?.next = ListNode(4)
//
//
//var result = Solution().addTwoNumbers(ListNode(0), ListNode(0))
//printNode(result!)
//addTwoArray([1,2,3,4], [1,2])

assert(addTwoArray([2,4,3], [5,6,4]) == [7,0,8])
assert(addTwoArray([1,8], [0]) == [1,8])
assert(addTwoArray([9,1], [1]) == [0,2])
assert(addTwoArray([9,1,3], [1]) == [0,2,3])
assert(addTwoArray([9,9], [1]) == [0,0,1])
assert(addTwoArray([9,8], [1]) == [0,9])
addTwoArray([8,9,9], [2])

format([9,9], 0)
format([9,9,9], 0)
