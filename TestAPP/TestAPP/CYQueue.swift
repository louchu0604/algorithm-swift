//
//  CYQueue.swift
//  aha
//
//  Created by louchu on 2017/8/24.
//  Copyright © 2017年 Cy Lou. All rights reserved.
//

import Foundation
class AnotherGenericQueue<Element>
{
    var queue:[Element]
    init() {
        queue = [Element]()
        
    }
    
    func push(object:Element) {
        queue.append(object)
    }
    func isEmpty() -> Bool {
        return queue.isEmpty
    }
    func pop() -> Element? {
        if (!queue.isEmpty) {
            return queue.removeFirst()
        }else
        {
            return nil
        }
    }
    func peak() -> Element? {
        if (!queue.isEmpty) {
            return queue.first
        }else
        {
            return nil
        }
    }
    
}

class Queue
{
    var queue : [Int]
    init() {
        queue = [Int]()
        
    }
    func push(object:Int) {
        queue.append(object)
    }
    func isEmpty() -> Bool {
        return queue.isEmpty
    }
    func pop() -> Int? {
        if (!queue.isEmpty) {
            return queue.removeFirst()
        }else
        {
            return nil
        }
    }
    func peak() -> Int? {
        if (!queue.isEmpty) {
            return queue.first
        }else
        {
            return nil
        }
    }
    func getSize() -> Int {
        return queue.count
    }
}
class StackOfQueue
{
    var stackofQueue :Queue
    init()
    {
        stackofQueue = Queue.init()
    }
    func push(object:Int)  {
        var queue2 = Queue.init()
        let quequecount = stackofQueue.getSize()
        for i in 0..<quequecount {
            queue2.push(object:stackofQueue.pop()!)
        }
        queue2.push(object:object)
        for i in 0..<quequecount+1 {
            stackofQueue.push(object:queue2.pop()!)
        }
        
    }
    func pop() -> Int? {
        if (!stackofQueue.isEmpty()) {
            
            var queue2 = Queue.init()
            let quequecount = stackofQueue.getSize()
            for i in 0..<quequecount {
                queue2.push(object:stackofQueue.pop()!)
            }
            let popint = queue2.pop()
            for i in 0..<quequecount-1 {
                stackofQueue.push(object:queue2.pop()!)
            }
            return popint
        }else
        {
            return nil
        }
    }
    
    func peak() -> Int? {
        if (!stackofQueue.isEmpty()) {
            
            var queue2 = Queue.init()
            let quequecount = stackofQueue.getSize()
            for i in 0..<quequecount {
                queue2.push(object:stackofQueue.pop()!)
            }
            let popint = queue2.peak()
            for i in 0..<quequecount {
                stackofQueue.push(object:queue2.pop()!)
            }
            return popint
            
        }else
        {
            return nil
        }
    }
    func getSize() -> Int {
        return stackofQueue.getSize()
    }
    
}
