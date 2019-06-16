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
    func test() {
        
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
    }
    
//    前序遍历 跟节点 左子树 右子树
    func preOrderRecursive(_ tree:TreeNode){
      
        if (tree != nil) {
            print(tree.value)
            if (tree.left != nil)
            {
                self.preOrderRecursive(tree.left!)
            }
            if (tree.right != nil)
            {
                self.preOrderRecursive(tree.right!)
            }
        }
    }
    func preOrderNoneRecursive(_ tree:TreeNode){
            
        if (tree != nil) {
          
            var  prestack = GenericStack<Any>.init()
            var node:TreeNode?
            node = tree
            while(node != nil || prestack.getSize()>0)
            {
               
                while(node != nil )//左边都入栈
                {
                    print(node?.value)
                    prestack.push(object: node)
                    if(node?.left != nil)
                    {
                        node = node?.left!
                    }else
                    {
                        node = nil
                    }
                }
               if(prestack.getSize()>0 )
               {
                node = prestack.pop() as! TreeNode
                if(node?.right != nil)
                {
                    node = node?.right!
                }else
                {
                    node = nil
                }
              
                
            
            }
            
        }
        }
        
    }
    
//    中序遍历 左子树 根节点 右子树
    func inOrderRecursive(_ tree:TreeNode){
        if (tree != nil) {
            if (tree.left != nil)
            {
                self.inOrderRecursive(tree.left!)
                print(tree.value)
            }
            
            if (tree.right != nil)
            {
                self.inOrderRecursive(tree.right!)
            }
        }
        
    }
    func inOrderNoneRecursive(_ tree:TreeNode) {
        
        if (tree != nil) {
            print(tree.value)
            var  instack = GenericStack<Any>.init()
            var node:TreeNode?
              node = tree
            while(node != nil || instack.getSize()>0)
            {
                
                while(node != nil )//左边都入栈
                {
                    instack.push(object: node)
                    if(node?.left != nil)
                    {
                        node = node?.left!
                    }else
                    {
                        node = nil
                    }
                }
                
                if(instack.getSize()>0 )
                {
                    node = instack.pop() as! TreeNode
                    print(node?.value)
                    if(node?.right != nil)
                    {
                        node = node?.right!
                    }else
                    {
                        node = nil
                    }
                }
            }
        }
    }
//    后序遍历 左子树 右子树 根节点
    func postOrderRecursive(_ tree:TreeNode){
        if (tree != nil) {
           
            if (tree.left != nil)
            {
                self.postOrderRecursive(tree.left!)
            }
            if (tree.right != nil)
            {
                self.postOrderRecursive(tree.right!)
            }
             print(tree.value)
        }
    }
    func postOrderNoneRecursive(_ tree:TreeNode){
        if (tree != nil) {
            print(tree.value)
            var  poststack = GenericStack<Any>.init()
            var  postResultstack = GenericStack<Any>.init()
            var  node:TreeNode?
            node = tree
            while(node != nil || poststack.getSize()>0)
            {
                while(node != nil )//左边都入栈
                {
                    poststack.push(object: node)
                    postResultstack.push(object: node)

                    if(node?.right != nil)
                    {
                        node = node?.right!
                    }else
                    {
                        node = nil
                    }
                }
                
              
                if(poststack.getSize()>0 )
                {
                    node = poststack.pop() as! TreeNode
                    if(node?.left != nil)
                    {
                        node = node?.left!
                    }else
                    {
                        node = nil
                    }
                }
            }
            while(postResultstack.getSize()>0)
            {
                print((postResultstack.pop() as! TreeNode).value)
            }
        }
        
    }
    
     func findMax(_ tree:TreeNode) -> Int? {
        if tree.right==nil {
            return tree.value
        }else
        {
          return self.findMax(tree.right!)
        }
    }
  
     func findMin(_ tree:TreeNode) -> Int? {
        if tree.left==nil {
            return tree.value
        }else
        {
          return  self.findMin(tree.left!)
        }
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
