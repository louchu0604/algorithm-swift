//
//  TwoThreeTree.swift
//  TestAPP
//
//  Created by 楼楚 on 2017/10/11.
//  Copyright © 2017年 Cy Lou. All rights reserved.
//2-3 树

import Foundation
class TwoTreeTreeNode {
    var values:[Int]
    var left:TwoTreeTreeNode?
    var middle:TwoTreeTreeNode?
    var right:TwoTreeTreeNode?
    init(_ newvalue:[Int])
    {
        self.values = newvalue;
        self.left = nil;
        self.middle = nil;
        self.right = nil;
       
        
    }
    
}
class TwoThreeSearchTree {
    var size=0
    var root:TwoTreeTreeNode?
    init(_ values:[Int]) {
       root = TwoTreeTreeNode.init(values);
       
       size+=1
       
    }

    func findX(_ object:Int,_ tree:TwoTreeTreeNode) -> Bool? {
        if(tree.values.count==1)
        {
            if(object<tree.values[0])
            {
                
                
            }else if(object>tree.values[0])
            {
                
            }else
            {
                return true;
            }
        }else
        {
            if (object<tree.values[0]) {
                if (tree.left==nil) {
                    return false
                }else
                {
                    return  self.findX(object, tree.left!);
                    
                }
            }else
                if(object>tree.values[1])
                {
                    if (tree.right==nil) {
                        return false
                    }else
                    {
                        return  self.findX(object, tree.right!);
                        
                    }
                }else
                {
                    if (tree.middle==nil) {
                        return false
                    }else if(tree.middle?.values[0]==object)
                    {
                        return true
                        
                    }else
                    {
                        return false
                    }
                    
            }
        }
        
        
        return false
        
    }
    
    func findMax(_ tree:TwoTreeTreeNode) -> Int? {
        if tree.right==nil {
            if(tree.values.count)==1
            {
                return tree.values[0]

            }else
            {
                return tree.values[1]

            }
        }else
        {
            return self.findMax(tree.right!)
        }
        return nil
    }
    
    func findMin(_ tree:TwoTreeTreeNode) -> Int? {
        if tree.left==nil {
            return tree.values[0]
        }else
        {
            return  self.findMin(tree.left!)
        }
        return nil
    }
    
    func insert(_ object:Int, _ tree:TwoTreeTreeNode,_ father:TwoTreeTreeNode)
    {
        // step1: find
      //父节点为2-的2-节点
        //父节点为3-的2-节点(只有一个节点的情况)
        //父节点为2-节点的3-节点
        //父节点为3-节点的3-节点

    }
    func delete(_ object:Int,_ tree:TwoTreeTreeNode,_ father:TwoTreeTreeNode)
    {
        
    }
}
