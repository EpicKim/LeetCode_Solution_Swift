//将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
//
//
//
//示例：
//
//输入：1->2->4, 1->3->4
//输出：1->1->2->3->4->4

public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }
 
class Solution {
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if (l1 == nil) {
            return l2
        }
        else if (l2 == nil) {
            return l1
        }
        else if (l1!.val < l2!.val) {
            l1?.next = mergeTwoLists(l1?.next, l2)
            return l1
        }
        else {
            l2?.next = mergeTwoLists(l1, l2?.next)
            return l2
        }
    }
}

var a=[1,2,4]
var b=[1,3,4]

func printNode(_ node:ListNode?) {
    if (node == nil) {
        return
    }
    print(node!.val)
    print("-")
    return printNode(node?.next)
    
}

var l1 = ListNode(1, ListNode(2, ListNode(4)))
var l2 = ListNode(1, ListNode(3, ListNode(4)))

printNode(Solution().mergeTwoLists(l1, l2))
