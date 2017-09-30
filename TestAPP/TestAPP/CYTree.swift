//
//  CYTree.swift
//  TestAPP
//
//  Created by 楼楚 on 2017/9/25.
//  Copyright © 2017年 Cy Lou. All rights reserved.
//

import Foundation
class TreeNode {
    var value:Int
    var left:TreeNode?
    var right:TreeNode?
    init(_ newvalue:Int) {
        self.value = newvalue
        self.left = nil
        self.right = nil
    }
}
class SearchTree {
    var size=0
    var root:TreeNode?
    init(_ elements:Array<Int>) {
        let length = elements.count
        for i in 0..<length {
            self.insert(elements[i])
        }
    }

  func insert(_ object:Int)
    {
        
        size+=1
    }
  private  func findX(_ object:Int,_ tree:TreeNode) -> TreeNode? {
//        if(tree==nil)
//        {
//            return nil
//        }
        if (object<tree.value) {
            if (tree.left==nil) {
                return nil
            }else
            {
                self.findX(object, tree.left!);

            }
        }else
        if(object>tree.value)
        {
            if (tree.right==nil) {
                return nil
            }else
            {
                self.findX(object, tree.right!);

            }
        }else
        {
            return tree

        }
        
        return nil
        
    }
 
    private func findMax(_ tree:TreeNode) -> Int? {
        if tree.right==nil {
            return tree.value
        }else
        {
            self.findMax(tree.right!)
        }
        return nil
    }
  
    private func findMin(_ tree:TreeNode) -> Int? {
        if tree.left==nil {
            return tree.value
        }else
        {
            self.findMin(tree.left!)
        }
        return nil
    }
   
    private func insert(_ object:Int, _ tree:TreeNode)
    {
        
    }
    private func delete(_ object:Int,_ tree:TreeNode)
    {
        
    }
    
}
