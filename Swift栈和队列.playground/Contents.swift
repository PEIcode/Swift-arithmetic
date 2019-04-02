import UIKit
/*

    | L |
    | I |
    | F |
    | O |
     ---

 */

//MARK: 用数组实现栈
class Stack {
    var stack: [AnyObject]
    /// 是否为空
    var isEmpty: Bool {
        return stack.isEmpty
    }
    /// 栈顶元素
    var peek: AnyObject? {
        return stack.last
    }
    init() {
        stack = [AnyObject]()
    }
    /// 进栈
    func push(object: AnyObject) {
        stack.append(object)
    }
    /// 出栈
    func pop() -> AnyObject? {
        if isEmpty {
            return nil
        } else {
            return stack.removeLast()
        }
    }
}

let s = Stack()
s.stack.append(1 as AnyObject)
s.stack.append("lpz" as AnyObject)

/*
 -----------
    FIFO
 -----------
 使用两个数组实现队列

 ------  -------
  left    right
 ------  -------

 PS: 二叉树的层序遍历
 */

class Queue {
    var queue: [AnyObject] = []
    var left: [AnyObject] = []
    var right: [AnyObject] = []

    var isEmpty: Bool {return left.isEmpty  && right.isEmpty}

    /// 入队
    func entry(_ newElement: AnyObject) {
        right.append(newElement)
    }
    /// 出队
    func out() -> AnyObject? {
        if left.isEmpty {
            left = right.reversed()
            right.removeAll()
        }
        return left.last
    }
}
