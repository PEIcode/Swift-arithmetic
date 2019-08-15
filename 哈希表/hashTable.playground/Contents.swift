import UIKit
//var arr = [1,2,3,45,6]
//arr[4]
//arr.remove(at: 0)
//arr[3]
//00000110
//位运算
//按位与
1 & 0
1 & 1
0 & 0
1 & 2
4 & 7

1
11
111
//按位h异或
1 ^ 1
1 ^ 0
0 ^ 1
0 ^ 0
1 ^ 2
1 ^ 3
3 ^ 1
6 >> 1 //右移11
6 << 1 //左移1100
var set = Set<Int>()
set.insert(1)
set.insert(2)
set.insert(4)
set.insert(3)
set.insert(10)
print(set)
if set.contains(1) {
    print(set.endIndex)
}
//Dictionary
var dict = Dictionary<Int, String>()

dict[1] = "sss"
dict[2] = "ssss"
dict[1] = "ddd"
let str = "ddd"
str.hash
dict[1].hash
dict[1] == str


//Hasher
var hasher = Hasher()
hasher.combine(23)
hasher.combine("Hello")
let hashValue = hasher.finalize()
print(hasher, hashValue)

print(dict[1] ?? "", dict[1]?.hash ?? 0, dict[1].hashValue)
// ddd 517990311 7965113464342360514
// hash: An unsigned integer that can be used as a hash table address.
// hasnValue: The hash value.


//Set
var set1 = Set<String>()
set1.contains("22")
set1.contains("ssss")

//两数交换
var a = 1
var b = 2
a = a + b
b = a - b
a = a - b
// 两数交换使用 ^  01 10 11
var c = 1
var d = 2
c = c ^ d
d = c ^ d
c = c ^ d




/// 算法，使用数组简单构建，会超出预算时间
class MyHashSet {

    var hashArray: [Int]
    init() {
        hashArray = []
    }

    func add(_ key: Int) {
        if contains(key) { return }
        hashArray.append(key)
    }

    func remove(_ key: Int) {
        if hashArray.contains(key) {
            for (index, item) in hashArray.enumerated() {
                if item == key {
                    hashArray.remove(at: index)
                }
            }
        } else {
            return
        }
    }

    /** Returns true if this set contains the specified element */
    func contains(_ key: Int) -> Bool {
        return hashArray.contains(key)
    }

}

/**
 * Your MyHashSet object will be instantiated and called as such:
 * let obj = MyHashSet()
 * obj.add(key)
 * obj.remove(key)
 * let ret_3: Bool = obj.contains(key)
 */

let set2 = MyHashSet()
//set.hashArray
set2.add(1)
set2.add(2)
set2.contains(1)
set2.contains(3)
set2.add(2)
set2.contains(2)
print(set2.hashArray)

set2.remove(2)
set2.contains(2)


/// 拉链法
class MyHashSet1 {

    private class Note {
        var val: Int
        var next: Note? = nil

        init(val: Int, next: Note? = nil) {
            self.val = val
            self.next = next
        }
    }

    private var list: [Note?]

    /** Initialize your data structure here. */
    init() {
        self.list = Array(repeating: nil, count: 1024)
    }

    func add(_ key: Int) {
        if contains(key) { return }
//        1 ，2 ， 3
        let idx = hashCode(key)
        if let note = list[idx] {
            list[idx] = Note(val: key, next: note)
        } else {
            list[idx] = Note(val: key)
        }
    }

    func remove(_ key: Int) {
        let idx = hashCode(key)
        var last: Note? = nil
        var note: Note? = list[idx]
        while note != nil {
            if note?.val == key {
                if last == nil {
                    list[idx] = note?.next
                } else {
                    last?.next = note?.next
                }
                return
            }
            last = note
            note = note?.next
        }
    }

    func contains(_ key: Int) -> Bool {
        let idx = hashCode(key)
        var note = list[idx]
        while note != nil {
            if note!.val == key {
                return true
            }
            note = note?.next
        }
        return false
    }

    func hashCode(_ key: Int) -> Int {
        return key & (list.count - 1)
    }
}

let hashSet = MyHashSet1()



