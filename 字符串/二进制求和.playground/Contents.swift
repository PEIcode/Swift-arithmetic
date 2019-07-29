import UIKit

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        //获取最小的count
        var count1 = a.count-1
        var count2 = b.count-1
        var maxC = count1 >= count2 ? count1 : count2
        let array1 = a.map {
            return $0
        }
        let array2 = b.map {
            return $0
        }
        //如果大于1就x进位
        var sum = 0
        var tmp = 0
        var array3: [Int] = []
        while(count1 >= 0 || count2 >= 0) {

            let l = (count1 >= 0) ? Int(String(array1[count1]))! : 0
            let p = (count2 >= 0) ? Int(String(array2[count2]))! : 0
            sum = tmp + l + p

            tmp = (sum > 1) ? 1 : 0
            array3.append(sum%2)
            if maxC == 0 && tmp == 1 {
                array3.append(1)
            }

            if count1 >= 0 {
                count1 = count1 - 1
            }

            if count2 >= 0 {
                count2 = count2 - 1
            }
            maxC = maxC - 1
        }
        print(array3)
        let endA = array3.reversed().map { return $0
        }
        let s = endA.map { (i) -> String in
            return String(i)
        }
        print(s.joined(separator: ""))
        return s.joined(separator: "")
    }
}
let soul = Solution()
soul.addBinary("110", "100")
