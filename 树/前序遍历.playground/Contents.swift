import UIKit

var str = "Hello, playground"

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    var readed: Bool
    init(val: Int, left: TreeNode?, right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
        self.readed = false
    }
}
//let left = TreeNode()
let right2 = TreeNode(val: 4, left: nil, right: nil)
let right = TreeNode(val: 3, left: nil, right: right2)
let left = TreeNode(val: 2, left: nil, right: nil)
left.left = TreeNode(val: 5, left: nil, right: nil)
left.right = TreeNode(val: 6, left: nil, right: nil)
let root = TreeNode(val: 1, left: left, right: right)
/*
                        1
                   2         3
                5     6          4

  4
 1. 2 . 5 . 6 . 3 . 4
*/

func inputTreeNode(root: TreeNode?) {
    guard let root = root else {
        return
    }
    print(root.val)
    inputTreeNode(root: root.left)
    inputTreeNode(root: root.right)
}

inputTreeNode(root: root)

class Stack {
    var nums: [TreeNode] = []
    func push(a: TreeNode) {
        nums.append(a)
    }

    func pop() {
        nums.removeLast()
    }

    func top() -> TreeNode {
        return nums.last!
    }

    func isEmpty() -> Bool {
        if nums.isEmpty {
            return true
        }else {
            return false
        }
    }
}

func perorder(_ root: TreeNode?) -> [Int] {
    var a: [Int] = []
    let stack = Stack()

    guard let root1 = root else {
        return []
    }
//    a.append(root1.val)
    stack.push(a: root1)
    while !stack.isEmpty() {
        let p = stack.top()
        stack.pop()
        a.append(p.val)
        if p.right != nil {
            stack.push(a: p.right!)
        }
        if p.left != nil {
            stack.push(a: p.left!)
        }
    }
    print("sss")
    print(a)

    return []
}
perorder(root)
//    for node in stack.nums.reversed() {
////        print(node.val)
//        if node.right != nil {
////            stack.push(a: node.right)
//            stack.push(a: node.right!)
//            a.append(node.right!.val)
//        }
//    }
//    print(a)


//不使用压栈方式
//func preorder(_ root: TreeNode?) -> [Int] {
//    var a: [Int] = []
//    let stack = Stack()
//
//    guard let root1 = root else {
//        return a
//    }
//
//    var tmp: TreeNode? = root1
//    while tmp != nil {
//        if tmp.readed == false {
//            a.append(tmp.val)
//            stack.push(a: tmp)
//            tmp.readed = true
//            print("dasd\(tmp.val)")
//
//            if let tmpL = tmp.left {
//                tmp = tmpL
//                continue
//            }
//            if let tmpR = tmp.right {
//                tmp = tmpR
//                continue
//            }
//        }
//        stack.pop()
//        tmp = stack.nums.last!
//        if let tmpR = tmp.right, tmpR.readed == false {
//            tmp = tmpR
//        }
//    }
//    return a
//}
//
//preorder(root)




