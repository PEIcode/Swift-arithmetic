import UIKit

func swap(_ array: inout [Character], _ p: Int, _ q: Int) {
    //断言
    assert(p >= 0 && p < array.count)
    assert(q >= 0 && q < array.count)
    (array[p], array[q]) = (array[q], array[p])
}

// 使用字典计算数组重复的值
let s = "hello".map{ ($0, 1) }
print(s)
let d = Dictionary.init("hello".map{ ($0, 1) }, uniquingKeysWith: +)
print(d)

//翻转每一个单词
let str = "the sky is blue"
var array = str.components(separatedBy: " ")
array.reverse()
let resultArray = array.joined(separator: " ")
