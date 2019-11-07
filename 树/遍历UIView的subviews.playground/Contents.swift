import UIKit

var str = "Hello, playground"
class Stack {
    var stack: [UIView]
    /// 是否为空
    var isEmpty: Bool {
        return stack.isEmpty
    }
    /// 栈顶元素
    var peek: AnyObject? {
        return stack.last
    }
    init() {
        stack = [UIView]()
    }
    /// 进栈
    func push(object: UIView) {
        stack.append(object)
    }
    /// 出栈
    func pop() -> UIView? {
        if isEmpty {
            return nil
        } else {
            return stack.removeLast()
        }
    }
}


func fetchLabels(for superViews: UIView) -> [UILabel] {

    var array: [UILabel] = []
    let stack = Stack()
    stack.push(object: superViews)

    while !stack.isEmpty {

        let view = stack.pop()
        if view?.isKind(of: UILabel.self) ?? false {
            array.append(view as! UILabel)
        }
        if view?.subviews.count ?? 0 > 0 {
            for i in view!.subviews {
                stack.push(object: i)
            }
        }
    }
    return array
}

