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
        if (tail==nil) {
            tail = ListNode.init(val);
            tail?.next = nil;
            size+=1
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
    //头插法
    func appendToHead(_ val:Int) -> Bool {
        if (head==nil) {
            head = ListNode.init(val);
            head?.next = nil;
            size+=1
        }else
        {
            let oldnhead = head
            let insertNode = ListNode.init(val)
            insertNode.next = oldnhead
            head = insertNode
            size += 1

        }
        
        return true
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
    func remove(_ index:Int) -> Bool {
        if (index>size) {
            return false
        }
        var  tempNode = head
        
        for i in 0..<index {
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
