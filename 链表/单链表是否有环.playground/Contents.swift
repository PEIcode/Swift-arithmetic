import UIKit

class Node {
    var val: Int
    var next: Node?

    init(val: Int, next: Node?) {
        self.val = val
        self.next = next
    }
}
var nodeC = Node(val: 5, next: nil)

var node4 = Node(val: 4, next: nodeC)
var node3 = Node(val: 3, next: node4)
var node2 = Node(val: 2, next: node3)
var node1 = Node(val: 1, next: node2)

var head = Node(val: 0, next: node1)
//nodeC.next = head


func hasCircle(head: Node?) -> Bool {
    var flag = false
    var slow = head
    var fast = head

    while (slow != nil) && (fast?.next != nil) {
        slow = slow?.next
        fast = fast?.next?.next

        if slow?.val == fast?.val {
            flag = true
            break
        }
    }
    return flag
}

hasCircle(head: head)

