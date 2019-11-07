import UIKit


class MyCircularQueue {

    var array: [Int] = []
    var maxIndex = 0
    /** Initialize your data structure here. Set the size of the queue to be k. */
    init(_ k: Int) {
        maxIndex = k
//        array = Array(repeating: 1, count: k)
    }

    /** Insert an element into the circular queue. Return true if the operation is successful. */
    func enQueue(_ value: Int) -> Bool {
        if array.count < maxIndex {
            array.append(value)
            return true
        }
        return false
    }

    /** Delete an element from the circular queue. Return true if the operation is successful. */
    func deQueue() -> Bool {
        if array.count > 0 {
            array.removeFirst()
            return true
        }
        return false
    }

    /** Get the front item from the queue. */
    func Front() -> Int {
        if array.count > 0 {
            return array.first!
        }
        return -1
    }

    /** Get the last item from the queue. */
    func Rear() -> Int {
        if array.count > 0 {
            return array.last!
        }
        return -1
    }

    /** Checks whether the circular queue is empty or not. */
    func isEmpty() -> Bool {
        if array.count > 0 {
            return false
        }
        return true
    }

    /** Checks whether the circular queue is full or not. */
    func isFull() -> Bool {
        if array.count == maxIndex {
            return true
        }
        return false
    }
}

/**
 * Your MyCircularQueue object will be instantiated and called as such:
 * let obj = MyCircularQueue(k)
 * let ret_1: Bool = obj.enQueue(value)
 * let ret_2: Bool = obj.deQueue()
 * let ret_3: Int = obj.Front()
 * let ret_4: Int = obj.Rear()
 * let ret_5: Bool = obj.isEmpty()
 * let ret_6: Bool = obj.isFull()
 */

let obj = MyCircularQueue(3)
obj.enQueue(2)
obj.Rear()
obj.Front()
