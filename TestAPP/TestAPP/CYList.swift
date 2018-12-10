//
//  CYList.swift
//  TestAPP
//
//  Created by 楼楚 on 2017/8/24.
//  Copyright © 2017年 Cy Lou. All rights reserved.
//

import Foundation
class ListNode {
    var value:Int
    var next:ListNode?
    init(_ valuenew:Int) {
        self.value = valuenew
        self.next = nil
    }
}
class LinkedList {
    var head:ListNode?
    var tail:ListNode?
    var size = 0
    //指定位置插入
    func insertToindex(_ index:Int,val:Int)-> Bool {
        if (head==nil) {
            head = ListNode.init(val);
            head?.next = nil;
            size += 1
        }
        if (index>size) {
            return false
        }
        var  tempNode = head
        
        for i in 0..<index {
            if ((tempNode?.next) == nil) {
                return false
            }
            tempNode = tempNode?.next//取出
        }
        let insertNode = ListNode.init(val)
        insertNode.next = tempNode?.next
        tempNode?.next = insertNode
       
        size += 1
        return true
    
    }
    //尾插法
    func appendToTail(_ val:Int) -> Bool {
        if (tail == nil && head == nil) {
            tail = ListNode.init(val);
            tail?.next = nil;
            head = ListNode.init(val);
            head?.next = nil;
           
        }else
        {
            let oldTail = tail;
            let insertNode = ListNode.init(val);
            insertNode.next = nil;
            oldTail?.next = insertNode;
            tail = insertNode;
           
        }
        size += 1

        return true
    }
    func appendArrayToTail(array:[Int]) -> Bool {
        for item in array {
           if (tail == nil && head == nil) {
                tail = ListNode.init(item);
                tail?.next = nil;
                head = ListNode.init(item);
                head?.next = nil;
                
            }
            else
            {
                let oldTail = tail;
                let insertNode = ListNode.init(item);
                insertNode.next = nil;
                oldTail?.next = insertNode;
                tail = insertNode;
                if(head?.next == nil)
                {
                    head?.next = insertNode
                }
            }
             size+=1
        }
        
        
        return true
    }
    //头插法
    func appendToHead(_ val:Int) -> Bool {
      if (tail == nil && head == nil) {
            tail = ListNode.init(val);
            tail?.next = nil;
            head = ListNode.init(val);
            head?.next = nil;
            
        }
        else
        {
            let oldnhead = head
            let insertNode = ListNode.init(val)
            insertNode.next = oldnhead
            head = insertNode
              size+=1

        }
          size+=1
        return true
    }
    func appendArrayToHead(array:[Int]) -> Bool
    {
        for item in array {
            
             if (tail == nil && head == nil) {
                tail = ListNode.init(item);
                tail?.next = nil;
                head = ListNode.init(item);
                head?.next = nil;
                
            }
            else
            {
                let oldnhead = head
                let insertNode = ListNode.init(item)
                insertNode.next = oldnhead
                head = insertNode
                 size+=1
            }
             size+=1
        }
        return true
    }
    func printList() {
        var firstNode = head
        while firstNode != nil {
            print(firstNode?.value)
            firstNode = firstNode?.next
        }
    }
    func query(_ index:Int) ->Int?
    {
        if index>size {
            return nil
        }else
        {
            var tempnode = head
            for i in 0..<index
            {
                tempnode = tempnode?.next
            }
            return tempnode?.value
        }
        
    }
    func removeNode(value:Int) {
        var currentNode = head
        if currentNode == nil {
            print("sorry ,list is empty")
        }
        var preNode = head
        var isFirst = true
        while currentNode != nil {
            if currentNode?.value == value
            {
                print("find equal one")
//                前一个
//                正常情况：
                if(currentNode?.next != nil && isFirst == false)
                {
                    print("case:next not nil , not head")
                    preNode?.next = currentNode?.next
                    currentNode = currentNode?.next
                }else if (currentNode?.next == nil && isFirst == false)
                {
                     print("case:next nil , not head")
                    preNode?.next = nil
                    tail = preNode
                    currentNode = nil
                    
                }else if (currentNode?.next != nil && isFirst == true)//是head
                {
                     print("case:next not nil , is head")
                    head = currentNode?.next
                    currentNode = currentNode?.next
                    preNode = head
                    
                    
                }else
                {
                    print("case:next nil , is head")

                    head = nil
                    currentNode = nil
                     isFirst = false
                }
               
                size -= 1
            }else
            {
                preNode = currentNode
                currentNode = currentNode?.next
                 isFirst = false
            }
            
           
        }
    }
    func remove(_ index:Int) -> Bool {
        if (index>size) {
            return false
        }
        if index == 0 {
            head = head?.next
            size -= 1
            return true
        }
        var  tempNode = head
        
        for i in 1..<index {
            if ((tempNode?.next) == nil) {
                return false
            }
            tempNode = tempNode?.next//取出要删的前一个
        }
        
        let toremove = tempNode?.next//要删除的这一个
        let nextofremove = toremove?.next//要删除的后一个
        tempNode?.next = nextofremove;//
        
        size-=1;
        return true
    }
    func getSize() -> Int {
        return size
    }
    
    
}
