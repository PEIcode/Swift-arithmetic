import UIKit
/*
 一个父亲，准备为自己的儿女存钱上大学，为此，给他们分别开了一个账户，轮流存钱；
 第一月，给儿子存7.5元，第二个月，给女儿存7.5元，从第三个月开始，存钱数
 为前两个月之和（即第三个月，给儿子存钱数为15元）。
 请问，2年后，他们的账户分别有多少钱？
 */

var array: NSMutableArray = [1,2,3,4]{
    didSet {
        print("array")
    }
}

var arrayA = array{
    didSet {
        print("arrayA")
    }
}

//arrayA = [1,2,3]
print(String(format: "%p", array))
print(String(format: "%p", arrayA))

//array = [1,2,3,4,5]
//array.add(1)
array.insert(10, at: 2)
//array.insert(8, at: 1)
print(String(format: "%p", array))
//arrayA = [111,22]
print(String(format: "%p", arrayA))

//array = [1,2,3,4]
print(array,arrayA)


var a = [1,2,3,4] {
    didSet {
        print("ssss")
    }
}
//a = [12,33]
print(String(format: "%p", a))
//a[0] = 5
a.insert(2, at: 1)
print(String(format: "%p", a))
print(a)
//a[0] = 5

var b: NSMutableArray = [1,2,3,4,5,6]

for i in b {
    print(i)
    b.removeLastObject()
}
print(b)





var sonAccount = 75
var daughterAccount = 75
var currentMoney = 0

func theirAccount(month: Int) -> [Int] {

    if month == 1 {
        return [75, 0]
    } else if month == 2 {
        return [75, 75]
    }


//    let cunrrentMoney = calculateCurrentMoney(month: month)
//
//    if month % 2 == 0 {
//        daughterAccount += cunrrentMoney
//    }else {
//        sonAccount += cunrrentMoney
//    }


    return [sonAccount, daughterAccount]
}

func calculateCurrentMoney(month: Int) -> [Int: Int] {

    var dict = [Int: Int]()

    for index in 1...month {
        if index == 1 {
            dict[index] = 75
            continue
        }
        if index == 2 {
            dict[index] = 75
            continue
        }

        dict[index] = dict[index - 1]! + dict[index - 2]!

    }

    return dict
}

calculateCurrentMoney(month: 4)

theirAccount(month: 5)



