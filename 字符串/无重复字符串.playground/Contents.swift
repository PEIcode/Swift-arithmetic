import UIKit

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var length: Int = 0
        var newStr: String = ""
        var array: [Int] = []
        var temp: Int = 0
//        for d in s {
//            if newStr.contains(d) {
//                array.append(newStr.count)
//                newStr = ""
//                newStr.append(d)
//            } else {
//                newStr.append(d)
//                array.append(newStr.count)
//            }
//        }
        var dict: [Character: Int] = [:]
        for (i,c) in s.enumerated() {
            if dict.keys.contains(c) {

            }
//            if newStr.contains(c) {
//                temp = i
//                array.append(temp)
//                newStr = ""
//                newStr
//            } else {
//                newStr.append(c)
//            }
        }
        //求数组中的最大值
        return array.max() ?? 0
    }
}
let a = Solution()
a.lengthOfLongestSubstring("abcabcbb")

class Solution2 {
     func lengthOfLongestSubstring2(_ s: String) -> Int {
        var left = 0
        var right = 0
        var dic : [String : Int] = [:]
        let characters : [String] = s.map{String($0)}
        characters.reversed()[3]
        characters.sorted()
        print(characters)
        var lenths : [Int] = []
        for (index, value) in characters.enumerated() {
            if dic.keys.contains(value) && left <= dic[value]! {
                     left = dic[value]! + 1
            }
            dic.updateValue(index, forKey: value)
            right = index
            lenths.append(right - left + 1)
        }
        return lenths.max() ?? 0
    }

    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        let i = k
        let nums2 = nums
        nums2.sorted(by: >)[k-1]

        let nums3 = nums2.sorted()
        let nums4 = nums3.reversed() as [Int]
        let a = nums4[i]
        return a
    }
}
let b = Solution2()
b.lengthOfLongestSubstring2("abcabcbb")
b.findKthLargest([1,2,3,4,5], 3)
let i = 123
let d = 234
let j = String(i+d)
for s in j.reversed() {
    print(s)
}

