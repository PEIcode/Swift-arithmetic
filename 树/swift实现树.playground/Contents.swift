import UIKit
/*
 节点，一般给定二叉树的根节点，在访问其他节点；
 深度：树中节点最大层次为树的深度
 结点的度：一个节点的子树数目称为该节点的度
 树的度：全部节点中最大的度称为树的度

 如图：
                A
               / \
              /   \
             B     C
            / \   / \
           D   E F   G
          / \     \
         H   I     K

 二叉树遍历方式：
 前序遍历：*先访问根节点*，然后前序遍历左子树，再前序遍历右子树。（中， 左， 右）
         A->B->D->H->I->->E->C->F->K->G
 中序遍历：从根节点开始（*注意不是访问根节点*），中序遍历根节点的左子树，然后访问根节点，最后中序遍历右子树（左， 中， 右）
         H->D->I->B->E->A->F->K->C->G
 后序遍历：从左到右先叶子后节点的方式遍历访问左右子树，*最后访问根节点*（左 右 中）
         H->I->D->E->B->K->F->G->C->A
 层序遍历：从树的第一层，也就是根节点开始访问，从上到下逐层遍历
         ABCDEFGHIK


 一般来讲，递归和栈，队列用于层序遍历
*/
class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int) {
        self.val = val
    }
}
class Solution: NSObject {
    //计算树的最大深度
    func maxDepth(root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        return max(maxDepth(root: root.left), maxDepth(root: root.right)) + 1
    }
}


