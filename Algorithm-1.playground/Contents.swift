//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


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
var stack = Stack.init()
stack.push(object: 3)
stack.push(object: 57)
stack.push(object: 46)
stack.push(object: 7)
stack.pop()
let b = stack.peak()
let a = stack.getSize()
var genericStack = GenericStack<String>()
genericStack.push(object: "hello")
genericStack.push(object: "hi")
genericStack.push(object: "hola")
let c = genericStack.getSize()


