import UIKit
/*
 swift实现链表，这里记录链表常用场景
*/
//创造节点
class ListNode {
    var val: Int
    var next: ListNode?

    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
//链表
class List {
    var head: ListNode?
    var tail: ListNode?

    // 头插法
    func appendToHead(_ val: Int) {
        if head == nil {
            head = ListNode(val)
            tail = head
        } else {
            let temp = ListNode(val)
            temp.next = head
            head = temp
        }
    }

    //尾插法
    func appendToTail(_ val: Int) {
        if tail == nil {
            tail = ListNode(val)
            head = tail
        } else {
            tail?.next = ListNode(val)
            tail = tail?.next
        }
    }
}


let a = List()
a.appendToHead(2)
a.appendToHead(3)
a.appendToTail(4)
a.tail
a.head
Int.max



