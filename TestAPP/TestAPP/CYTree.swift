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
        if(size==0)
        {
            root = TreeNode.init(object);
            
            size+=1

        }else
        {
            self.insert(object, root!)
        }
    }
   func findX(_ object:Int,_ tree:TreeNode) -> Bool? {

        if (object<tree.value) {
            if (tree.left==nil) {
                return false
            }else
            {
              return  self.findX(object, tree.left!);

            }
        }else
        if(object>tree.value)
        {
            if (tree.right==nil) {
                return false
            }else
            {
              return  self.findX(object, tree.right!);

            }
        }else
        {
            return true

        }
        
        return false
        
    }
 
     func findMax(_ tree:TreeNode) -> Int? {
        if tree.right==nil {
            return tree.value
        }else
        {
          return self.findMax(tree.right!)
        }
        return nil
    }
  
     func findMin(_ tree:TreeNode) -> Int? {
        if tree.left==nil {
            return tree.value
        }else
        {
          return  self.findMin(tree.left!)
        }
        return nil
    }
   
     func insert(_ object:Int, _ tree:TreeNode)
    {
        if(object==tree.value)
        {
             print("exsist")
        }else if(object<tree.value)
        {
            if(tree.left==nil)
            {
                var newtree = TreeNode.init(object)
                tree.left = newtree
                size+=1

            }else
            {
             self.insert(object, tree.left!)
            }
            
        }else
        {
            if(tree.right==nil)
            {
                var newtree = TreeNode.init(object)
                tree.right = newtree
                size+=1

            }else
            {
                self.insert(object, tree.right!)

            }
        }
        
    }
    func delete(_ object:Int,_ tree:TreeNode,_ father:TreeNode)
    {

       if (object==root?.value)
       {

        root==nil
        size = 0
        }else if(object<tree.value)
       {
        self.delete(object, tree.left!,tree)
        }else if(object>tree.value)
       {
        self.delete(object, tree.right!,tree)

        }else//found tree to be deleted
       {
        if(tree.left==nil&&tree.right==nil)//no child
        {

            if(tree.value>father.value)
            {
                father.right = nil
            }else
            {
                father.left = nil
            }
            size-=1

        }else if((tree.left != nil)&&(tree.right != nil))//2 child
        {
             // two children
                let minvalue = self.findMin((tree.right)!)
                self.delete(minvalue!, (tree.right)!,tree)
                tree.value = minvalue!;
            
            
        }else //1 child
        {
            if(tree.left != nil)
                {
                    if(tree.value>father.value)
                    {
                        father.right = tree.left
                        
                    }else
                    {
                        father.left = tree.left
                    }
                    
            }else if(tree.right != nil)
                {
                if(tree.value>father.value)
                {
                father.right = tree.right
                }else
                {
                father.left = tree.right
                }
                }
         
            size-=1

        }
       
        
        }
    }
    
}
