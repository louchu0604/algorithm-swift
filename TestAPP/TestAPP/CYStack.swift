//
//  CYStack.swift
//  aha
//
//  Created by louchu on 2017/8/24.
//  Copyright © 2017年 Cy Lou. All rights reserved.
//

import Foundation
struct GenericStack<Element>
{
    var stack : [Element]
    init()
    {
        stack = [Element]()
    }
    mutating func push(object:Element)  {
        stack.append(object)
    }
    mutating func pop()->Element?
    {
        if (!stack.isEmpty) {
            return stack.removeLast()
        }else
        {
            return nil
        }
    }
    func isEmpty() -> Bool {
        return stack.isEmpty
    }
    func getSize() -> Int {
        return stack.count
    }
    func peak() -> Element? {
        if (!stack.isEmpty) {
            return stack.last
        }else
        {
            return nil
        }
    }
}

class Stack
{
    
    var stack : [Int]
    init(){
        stack = [Int]()
        
    }
    
    func push(object:Int) {
        stack.append(object)
    }
    
    func isEmpty() -> Bool {
        return stack.isEmpty
    }
    
    func getSize() -> Int {
        return stack.count
    }
    
    func pop() -> Int?{
        
        if (!stack.isEmpty) {
            return stack.removeLast()
            
        }else
        {
            return nil
        }
    }
    func peak() -> Int? {
        return stack.last
    }
}
