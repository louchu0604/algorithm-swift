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
            queue2.push(stackofQueue.pop()!)
        }
        queue2.push(object)
        for i in 0..<quequecount+1 {
            stackofQueue.push(queue2.pop()!)
        }
        
    }
    func pop() -> Int? {
        if (!stackofQueue.empty()) {
            
            var queue2 = Queue.init()
            let quequecount = stackofQueue.getSize()
            var popint = 0
            for i in 0..<quequecount-1 {
                queue2.push(stackofQueue.pop()!)
            }
            popint = stackofQueue.pop()!
            stackofQueue = queue2
//            for i in 0..<quequecount-1 {
//                stackofQueue.push(object:queue2.pop()!)
//            }
            return popint
        }else
        {
            return nil
        }
    }
    
    func peak() -> Int? {
        if (!stackofQueue.empty()) {
            
            var queue2 = Queue.init()
            let quequecount = stackofQueue.getSize()
            var popint = 0
            for i in 0..<quequecount {
                if i==quequecount-2 {
                    popint = stackofQueue.peak()!
                }
                queue2.push(stackofQueue.pop()!)
            }
            stackofQueue = queue2
            //            for i in 0..<quequecount-1 {
            //                stackofQueue.push(object:queue2.pop()!)
            //            }
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
