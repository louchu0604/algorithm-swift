//
//  TestAPPTests.swift
//  TestAPPTests
//
//  Created by louchu on 2017/8/24.
//  Copyright © 2017年 Cy Lou. All rights reserved.
//

import XCTest
@testable import TestAPP

class TestAPPTests: XCTestCase {

    override func setUp() {
        super.setUp()

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    func testList()
    {
        let list  = LinkedList.init()
        
        if(list.appendToHead(1))
        {
            XCTAssertEqual(list.query(0), 1)

        }else
        {
            XCTAssertEqual(list.getSize(),0)

        }
    }
    func testQueue() {
        let queue = Queue.init()
        
        queue.push(object: 3)
        queue.push(object: 4)
        queue.push(object: 9)
        
        XCTAssertEqual(queue.pop(),3)
        
    }
    func testStack() {
        let queue = Stack.init()
        queue.push(object: 1)
        queue.push(object: 2)
        queue.push(object: 10)
        
        XCTAssertEqual(queue.pop(), 10)
    }
    func testStackByQueue() {
        let queue = StackOfQueue.init()
        queue.push(object: 1)
        queue.push(object: 2)
        queue.push(object: 10)
        
        XCTAssertEqual(queue.pop(), 10)
    }
    func testBinaryTree()  {
        let tree = SearchTree.init([0,1,2,3])
//        tree.insert(3)
    
//        let minvalue =  tree.findMin(tree.root!)
        tree.delete(3, tree.root!,tree.root!);
        let maxvalue = tree.findMax(tree.root!)
//        XCTAssertEqual(tree.root?.value,0);
   
        XCTAssertEqual(maxvalue, 2)
        
        
    }

    
}
