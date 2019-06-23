//
//  NO.2addTwoNumbers.swift
//  TestAPP
//
//  Created by louchu on 2019/6/23.
//  Copyright © 2019年 Cy Lou. All rights reserved.
//

import Foundation
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if(l1==nil && l2 == nil)
    {
        return nil
    }
    if(l1==nil)
    {
        
    }
    if(l2==nil)
    {
        
    }
    
    
}
func listToNumber(_ l:ListNode) -> Int{
    var node = l
    var exp = 1
    var sum = 0
    while (node==nil)
    {
        sum = node.val * exp
        exp = exp * 10
        node = node.next
    }
    return sum
}
func numberToList(_ n:Int) -> ListNode (
    var sum = n

    var node =ListNode.init(sum % 10)




)
