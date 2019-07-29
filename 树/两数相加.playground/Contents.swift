import UIKit


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
      self.val = val
      self.next = nil
    }
}
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        let test = "123123213123213123123123123123123123213123123213123123123"
        print(test)
        var sum1: String = ""
        var sum2: String = ""
        while (l1 != nil || l2 != nil) {
            let x = (l1 != nil) ? String(l1!.val) : ""
            sum1 = x + sum1
            let y = (l2 != nil) ? String(l2!.val) : ""
            sum2 = y + sum2
            if (l1 != nil){
                l1 = l1!.next
            }
            if (l2 != nil){
                l2 = l2!.next
            }
        }
         print(sum1)

         print(sum2)
        let sum3 = String(Int(sum1)! + Int(sum2)!)
        print(sum3)
        let root = ListNode(0)
        var node = root
        for i in sum3.reversed() {
            let a = Int(String(i))
            // print(a!)
            let temp = ListNode(a!)
            // print(temp)
            node.next = temp
            node = node.next!
        }
        return root.next
    }

    func addTwoNumbers2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        //把当前节点初始化为哑节点
        let dummyHead = ListNode(0)
        //把p初始化为l1的头节点
        var p: ListNode? = l1
        //把q初始化为l2的头节点
        var q: ListNode? = l2
        //把起始节点(最后一个节点)初始化为哑节点
        //思路 每次curr要去获取下一个节点,但是上一个节点的值需要被保存起来
        //dummyHead是用来存储curr的 因为要操作curr去获取下一位 所以上一位必须被保存下来
        var curr: ListNode = dummyHead
        //进位默认为0
        var carry: Int = 0
        //只要有一个链表不为nil就进入循环
        while p != nil || q != nil {
            //如果l1的当前节点不为nil 取当前节点 如果为nil取0
            let x = (p != nil) ? p!.val : 0
            //如果l2的当前节点不为nil 取当前节点 如果为nil取0
            let y = (q != nil) ? q!.val : 0
            //求和
            //当前节点的数值相加并加上进位
            //(第一组数相加完才会有进位，所以第一组数的进位一定为0)
            let sum = carry + x + y
            //数字为一位还是两位 如果是一位 没有进位 如果是两位 有进位
            //一共10个数0->9
            carry = sum / 10
            //新链表当前节点的值为两个原链表当前节点的和除以10(进位)取余
            //(取后一位,因为可能有进位)
            curr.next = ListNode(sum % 10)
            //把下一个节点设置为当前节点
            curr = curr.next!
            //如果l1不为空 往下走查看下一个节点
            if p != nil { p = p!.next }
            //如果l2不为空 往下走查看下一个节点
            if q != nil { q = q!.next }
        }
        //如果carry不为0 则有进位(carry == 1) 把carry带入 直接把最右侧一个节点数值设置为1
        if carry > 0 {
            //curr是当前位 在循环结束后也是最后一位(不含进位)
            curr.next = ListNode(carry)
        }
        //返回链表
        return dummyHead.next
    }
}

let a = Solution()
let l1 = ListNode(0)
let l2 = ListNode(1)
let l3 = ListNode(2)

l1.next = l2
a.addTwoNumbers(l1, l3)

