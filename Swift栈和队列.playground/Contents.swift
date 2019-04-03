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

//Definition for a binary tree node.
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

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root  else {
            return []
        }
        var array: [[Int]] = [[]]
        var queue: [TreeNode] = []
//        var left: [Int] = []
//        var right: [Int] = []
//        var index = 0
        queue.append(root)
        while !queue.isEmpty {
            let size = queue.count
            /// 当前level
            var cur: [Int] = []
            for _ in 0..<size {
                let node = queue.removeFirst()
                cur.append(node.val)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            array.append(cur)
        }
        return array
    }

}
// 解法二：
class Solution2 {

    var result = [[Int]]()
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        level(order: 0, root: root)
        return result
    }
    private func level(order: Int, root: TreeNode?) {
        guard let root = root else {
            return
        }
        if result.count > order {
            result[order].append(root.val)
        } else {
            result.append([root.val])
        }
        level(order: order + 1, root: root.left)
        level(order: order + 1, root: root.right)
    }
}
