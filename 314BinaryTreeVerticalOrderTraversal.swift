/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */


class Solution {
    var colMap:[Int: [Int]] = [:] 
    func verticalOrder(_ root: TreeNode?) -> [[Int]] {
        
        var colVal = 0
        var result:[[Int]] = [[Int]]()
        var keys = [Int]()
        
        helper(root: root, colVal: 0)
        
        for (key, val) in colMap{
            keys.append(key)
        }
        keys.sort()
        
        for key in keys{
            result.append(colMap[key]!)
        }
        
        
        return result
    }
    
    func helper(root: TreeNode?, colVal: Int){
        
        
        if(root == nil){ return }
        
        if(colMap[colVal] == nil){
            colMap[colVal] = [root!.val]
        }else{
            colMap[colVal]!.append(root!.val)
        }
        
        if(root!.left != nil){
            helper(root: root!.left, colVal: colVal - 1)
        }
        
        if(root!.right != nil){
            helper(root: root!.right, colVal: colVal + 1)
        }
        
    }
}










