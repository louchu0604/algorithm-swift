//
//  BasicDC.swift
//  TestAPP
//
//  Created by 楼楚 on 2019/6/16.
//  Copyright © 2019年 Cy Lou. All rights reserved.
//

import Foundation
/*
 Queue
 Stack
 LinkedList
 Tree
 */
//MARK: Queue:firstIn firstOut
class Queue {
    var queue:[Int]
     init(){
        queue = [Int]()
    }
    func push(_ object:Int)
    {
        queue.append(object)
    }
    func pop() ->Int?{
        if(queue.count == 0)
        {
            return nil
        }
        return queue.removeFirst()
    }
    func peak()->Int?{
        if(queue.count == 0)
        {
            return nil
        }
        return queue.first
    }
    func getSize()->Int{
        return queue.count
    }
    func empty() -> Bool{
        return queue.count==0
    }
}
class VQueue<Element> {
    var queue:[Element]
    init(){
        queue = [Element]()
    }
    func push(_ object:Element)
    {
        queue.append(object)
    }
    func pop() ->Element?{
        if(queue.count == 0)
        {
            return nil
        }
        return queue.removeFirst()
    }
    func peak()->Element?{
        if(queue.count == 0)
        {
            return nil
        }
        return queue.first
    }
    func getSize()->Int{
        return queue.count
    }
    func empty() -> Bool{
        return queue.count==0
    }
}
//MARK: Stack:firstIn lastOut
class Stack {
    var stack:[Int]
    init(){
        stack = [Int]()
    }
    func push(_object:Int)
    {
        stack.append(_object)
    }
    func pop() ->Int?{
        if(stack.count == 0)
        {
            return nil
        }
        return stack.removeLast()
    }
    func peak()->Int?{
        if(stack.count == 0)
        {
            return nil
        }
        return stack.last
    }
    func getSize()->Int{
        return stack.count
    }
    func empty() -> Bool{
        return stack.count==0
    }
    
}
class VStack<Element>{
    var stack:[Element]
    init(){
        stack = [Element]()
    }
    func push(_object:Element)
    {
        stack.append(_object)
    }
    func pop() ->Element?{
        if(stack.count == 0)
        {
            return nil
        }
        return stack.removeLast()
    }
    func peak()->Element?{
        if(stack.count == 0)
        {
            return nil
        }
        return stack.last
    }
    func getSize()->Int{
        return stack.count
    }
    func empty() -> Bool{
        return stack.count==0
    }
}
class listNode {
    var value:Int
    var before:listNode?
    var next:listNode?
    init(_ v:Int) {
        value = v
        before = nil
        next = nil
        
    }
    
}
//MARK: DoubleLinkedList
class list {
    var header:listNode?
    var tail:listNode?
    var size = 0
    func insertBeforeHeader (_ node:listNode ) -> Bool
    {
        if(size==0)
        {
            header = node
            tail = node
        }else
        {
            node.before = nil
            header!.before = node
            node.next = header
            header = node
        }
        self.inSize()
        return true
    }
    func insertAfterTail(_ node:listNode) -> Bool {
        if(size==0)
        {
            header = node
            tail = node
        }else
        {
            node.next = nil
            tail!.next = node
            node.before = tail
            tail = node
        }
        self.inSize()
        return true
    }
    func insertValueToIndex(_ index: Int,_ v:Int) -> Bool {
        return self.insertNodeToIndex(index, listNode.init(v))
    }
    func insertNodeToIndex(_ index: Int,_ node:listNode)->Bool{
        if(index>size)
        {
            return false
        }
        if(index==size)
        {
            return self.insertAfterTail(node)
        }
        if(index==0)
        {
            return self.insertBeforeHeader(node)
        }
        var tmp = header!
        for _ in 0..<index {
            tmp = tmp.next!
        }
        node.before = tmp.before
        node.next = tmp
        tmp.before = node
        self.inSize()
        return true
    }
    func inSize() {
        size += 1
    }
    func delHeader() -> Bool {
        if(size>1)
        {
            header = header!.next
            header!.before = nil
        }else
        {
            header = nil
            tail = nil
        }
     
        self.deSize()
        return true
    }
    func delTail() -> Bool {
        if(size>1)
        {
            tail = tail!.before
            tail!.next = nil
        }else
        {
            tail = nil
            header = nil
        }
       
        self.deSize()
        return true
    }
    func del(_ index:Int)->Bool
    {
        if(index>=size)
        {
            return false
        }
        if (index==0) {
            return delHeader()
        }
        if (index==size-1)
        {
            return delTail()
        }
        var tmp = header!
        for _ in 0..<index {
            tmp = tmp.next!
        }
        var before = tmp.before!
        var next = tmp.next!
        
        before.next = next
        next.before = before
        self.deSize()
        return true
    }
    func deSize() {
        size -= 1
    }
    func getSize() -> Int {
        return size
    }
    func empty() -> Bool {
        return size==0
    }
}
class treeNode {
    var value:Int
    var left:treeNode?
    var right:treeNode?
    init(_ a:Int) {
        value = a
        left = nil
        right = nil 
    }
}
class tree
{
    var root:treeNode?
    var size:Int
    init(_ objects:[Int]) {
        size = 0
    }
    func insert(_ value:Int){
        if(size==0)
        {
            var newNode = treeNode.init(value)
            root = newNode
            self.inSize()
        }else
        {
            if(self.valueExist(value))
            {//去重判断
                print("insert fail :value exist")
            }else
            {//不需要进行==判断
                 if(value>root!.value)
                 {
                    if(root!.right==nil)
                    {
                        let newNode = treeNode.init(value)
                        root!.right = newNode
                        
                    }else
                    {
                        self.insertValue(value, node: root!.right!)
                    }
                    
                 }else
                 {
                    if(root!.left==nil)
                    {
                        let newNode = treeNode.init(value)
                        root!.left = newNode
                        
                    }else
                    {
                        self.insertValue(value, node: root!.left!)
                    }
                }
                
                self.inSize()
            }
            
        }
        
    }
   private func insertValue(_ value:Int,node:treeNode) -> Bool {//不需要进行==判断
        if(value>node.value)
        {
            if(node.right==nil)
            {
                let newNode = treeNode.init(value)
                 node.right = newNode
            }else
            {
                self.insertValue(value, node: node.right!)
            }
            
        }else
        {
            if(node.left==nil)
            {
                let newNode = treeNode.init(value)
                node.left = newNode
            }else
            {
                self.insertValue(value, node: node.left!)
            }
            
        }
        
        return true
    }
   
    func inSize() {
        size += 1
    }
    func delete(_ value:Int)
    {
        if(!self.valueExist(value))
        {
            print("delete fail :value not exist")
        }else
        {
            
            
            if(value==root!.value)
            {
                if(root!.left==nil&&root!.right==nil)
                {
                    root=nil
                }else if((root!.left==nil) && (root!.right != nil))
                {
                    root = root!.right
                    
                }else if((root!.right==nil) && (root!.left != nil))
                {
                    root = root!.left
                }else
                {
                    var tmp = root!.right
                    while (tmp!.left != nil)
                    {
                        tmp = tmp!.left
                    }
                    tmp!.left = root!.left
                    root = root!.right
                }
                
                
                
            }else if(value>root!.value)
            {
                if(root!.right!.right==nil&&root!.right!.left==nil&&root!.right!.value==value)
                {
                    root!.right = nil
                }else
                {
                    self.deleteValue(value, node: &root!.right!)
                }
                
            }else
            {
                if(root!.left!.right==nil&&root!.left!.left==nil&&root!.left!.value==value)
                {
                    root!.left = nil
                }else
                {
                    self.deleteValue(value, node: &root!.left!)
                }
                
            }
            self.deSize()
            
            
        }
    }
//
    private func deleteValue(_ value:Int, node:inout treeNode)
    {
        if(value==node.value)
        {//  case had discussed:value matches && no child
            
            
            if((node.left==nil) && (node.right != nil))
            {
                node = node.right!
                
            }else if((node.right==nil) && (node.left != nil))
            {
                node = node.left!
            }else
            {
                var tmp = node.right
                while (tmp!.left != nil)
                {
                    tmp = tmp!.left
                }
                tmp!.left = root!.left
                node = root!.right!
            }
            
            
        }else if(value>node.value)
        {
            if(node.right!.right==nil&&node.right!.left==nil&&node.right!.value==value)
            {
               
                node.right = nil
            }else
            {
                self.deleteValue(value, node: &node.right!)
            }
            
        }else
        {
            if(node.left!.right==nil&&node.left!.left==nil&&node.left!.value==value)
            {
                node.left = nil
            }else
            {
                self.deleteValue(value, node: &node.left!)
            }
            
        }
    }
  
    func deSize()  {
        size -= 1
    }
    func getSize()->Int {
        return size
    }
    func valueExist(_ target:Int) -> Bool{
        if (size==0){
            return false
        }
        var first = root
        while true {
            if(target == first!.value)
            {
                return true
            }else if(target > first!.value )
            {
                if(first!.right == nil)
                {
                    return false
                }
                first = first!.right
            }else if(target < first!.value )
            {
                if(first!.left == nil)
                {
                    return false
                }
                first = first!.left
            }
        }
    }
    func findMin() ->Int?{
        if (size==0){
            return nil
        }
        var first = root
        while true {
            if(first!.left==nil)
            {
                break
            }
            first = first!.left
        }
        return first!.value
        
    }
    func findMax() ->Int?{
        if (size==0){
            return nil
        }
        var first = root
        while true {
            if(first!.right==nil)
            {
                break
            }
            first = first!.right
        }
        return first!.value
        
    }
    func preOrder(node:inout treeNode) {
        print(node.value)
        if(node.left != nil)
        {
            self.preOrder(node: &node.left!)
        }
        if(node.right != nil)
        {
            self.preOrder(node: &node.right!)
        }
    }
    func inOrder(node:inout treeNode) {
        
        if(node.left != nil)
        {
            self.inOrder(node: &node.left!)
        }
        print(node.value)
        if(node.right != nil)
        {
            self.inOrder(node: &node.right!)
        }
    }
    func postOrder(node:inout treeNode) {
        if(node.left != nil)
        {
            self.postOrder(node: &node.left!)
        }
        print(node.value)
        if(node.right != nil)
        {
            self.postOrder(node: &node.right!)
        }
    }
}

