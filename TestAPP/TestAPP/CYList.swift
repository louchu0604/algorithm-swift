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
        if (index>size) {
            return false
        }
        if (head==nil) {
            
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
        return false
    }
    //头插法
    func appendToHead(_ val:Int) -> Bool {
        return false
    }
    
    func remove(_ index:Int) -> Bool {
        return false
    }
    func getSize() -> Int {
        return size
    }
    
    
}
