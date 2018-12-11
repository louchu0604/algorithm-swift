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
    var before:ListNode?//双向的？
    init(_ valuenew:Int) {
        self.value = valuenew
        self.next = nil
        self.before = nil
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
    func moveLargger(_ target:Int) {
        
//       find target
        var pre = head
        var targetNode = head
        var find = false
        
        while find == false {//先找到目标节点
            if (pre?.next?.value)! > target
            {
                find = true
                targetNode = pre?.next
                break
            }
            pre = pre?.next
        }
        var currentPre = targetNode
        var currentNode =  currentPre?.next
      
        
        if find == true
        {
            while currentPre?.next != nil {
                if((currentNode?.value)! < target)
                {
                    
                    if(currentNode?.next == nil)
                    {print("tail move")
                        currentPre?.next = nil
                        tail = currentPre
                        pre?.next = currentNode
                        pre = currentNode
                        currentNode?.next = targetNode
                    
                    }else
                    {print("move")
                        currentPre?.next = currentNode?.next
                        pre?.next = currentNode
                        currentNode?.next = targetNode
                        pre = currentNode
                        currentNode = currentPre?.next
                    }
                    
                    
                    
                }else
                {
                    print("not move")
                    currentPre = currentNode
                    currentNode = currentNode?.next
                   
                }
            }
        }
        
        
        
        
        
    }
    //MARK: LeetCode上第328号问题：Odd Even Linked List
    /* 给定一个单链表，把所有的奇数节点和偶数节点分别排在一起。请注意，这里的奇数节点和偶数节点指的是节点编号的奇偶性，而不是节点的值的奇偶性。
     请尝试使用原地算法完成。你的算法的空间复杂度应为 O(1)，时间复杂度应为 O(nodes)，nodes 为节点总数。
     示例 1:
     输入: 1->2->3->4->5->NULL
     输出: 1->3->5->2->4->NULL
     示例 2:
     输入: 2->1->3->5->6->4->7->NULL
     输出: 2->3->6->7->1->5->4->NULL
     说明:
     应当保持奇数节点和偶数节点的相对顺序。
     链表的第一个节点视为奇数节点，第二个节点视为偶数节点，以此类推。*/
    
    func oddEvenLinkedList()
    {
//        将index为偶数的节点排后面 奇数的的节点排前面
        var aim = head
        
        var targetPre = head
        var target = head?.next
        for index in 1..<size  {
//            往前插 不影响index
            if index%2 == 0
            {
                print("move")
               targetPre?.next = target?.next
                target?.next = aim?.next
                aim?.next = target
                aim = target
                printList()
            }
//            更改指向
            targetPre = targetPre?.next
            target = targetPre?.next
            printList()
            
        }
    }
    func swapNeiber() -> Bool
    {
        if size<2 {
            return false
        }
       var index = 0
        var  pre = head
        var isFirst = true
        while index<size {
            if isFirst==true//是头
            {
               
                var oldHeader = head
                var oldSecond = head?.next
                
                head = oldSecond
                oldHeader?.next = oldSecond?.next
                head?.next = oldHeader
                pre = head?.next
                
            }else
            {
                var oldFirst = pre?.next
                var oldSecond = oldFirst?.next
                
                pre?.next = oldSecond
                oldFirst?.next = oldSecond?.next
                pre?.next?.next = oldFirst
                pre = oldFirst
            }
            
            
            
            
            index += 2
            isFirst = false
        }
       
        
        
        return true
    }
    
    
//  交换两个节点  一前 一后
    func swap(_ idx1:Int,_ idx2:Int) -> Bool {
        
      
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
    //MARK: 翻转链表   递归
    func reverseListRecurse()
    {
        
    }
    //MARK: 翻转链表   迭代
    func reverseListIterate(){
        
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
