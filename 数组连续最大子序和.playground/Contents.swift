import UIKit

var str = "Hello, playground"
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
//        var sum = nums[0]
//        var n = nums[0]
//        var i = 1
//        while i < nums.count {
//            if n > 0 {
//                n += nums[i]
//            } else {
//                n = nums[i]
//            }
//            if sum < n {
//                sum = n
//            }
//            i += 1
//        }
//        return sum
        if nums.isEmpty {
            return 0
        }


        var maxSum = Int.min

        var sum = 0

        for i in 0..<nums.count {
            sum += nums[i]
            maxSum = max(sum, maxSum)
            if sum < 0 {
                sum = 0
            }
        }

        return maxSum
    }
}
let s = Solution()
s.maxSubArray([-1,1])
