import UIKit

var str = "Hello, playground"

public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

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

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if (lists.count == 1) {
            return lists[0]
        }
        else if (lists.count == 2) {
            return mergeTwoLists(lists[0], lists[1])
        }
        else {
            let node = mergeTwoLists(lists[0], lists[1])
            var new = lists[2..<lists.count]
            new.insert(node, at: 0)
            return mergeKLists(Array(new))
        }
    }
}
