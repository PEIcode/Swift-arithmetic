import UIKit

// Definition for a binary tree node.
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
    func maxDepth(_ root: TreeNode?) -> Int {
        return root?.left != nil ? max(maxDepth(root?.left), maxDepth(root?.right)) + 1 : 0
    }
}
