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
    func testLinkedList() {
         let list  = LinkedList.init()
        list.appendArrayToTail(array:[1,2,6,3,4,5,6])
        list.printList()
        list.removeNode(value:6)
        list.printList()
    }
    func testReverse()
    {
    var str = "heazxcvbnm,"
    reverseString(str:&str)
    }
    func testcontainDup()
    {
        containsDuplicateII(array:[1,2,3,0,1],target:3)

    }
    func testBoom()
    {
        numberOfBoomerangs(points:[[0,0],[1,0],[2,0]])
    }
    func  testintersection() {
//        intersectionOfTwoArrays(array1:[7,7,8,9],array2:[3,4,5,2])
         var  array1 = [7,7,8,9];
        var  array2 = [3,4,5,2,7,7,8];

        intersectionOfTwoArrays2(array1:&array1,array2:&array2)

    }
    func testSubArraySum() {
        let  array1 = [1,2,3,10,4,5,6,7,8,9];
        sizeofsunarraysum(array: array1,target: 11)
    }
    func testtwosum()
    {
         var  array1 = [0,1,2,6,7,8,9,10];
//        twosum(array: &array1,target: 11)
        twosumofarray(array: array1,target: 17)
    }
    func testMoveZeros() {
        var  array1 = [0,1,0,2,0,0,0,33,44,88,0];
        moveZeros(array: &array1);
        moveZeros2(array: &array1);
    }
    func testsortColors() {
          var  array1 = [0,1,0,2,0,0,0,1,2,1,0,2,2,1,0,0];
    
//        sortColorFunc1(array: &array1);
        sortColorFunc2(array: &array1);
    }
    func testQucikSort() {
        
        var intArray = Array <Int>()
        intArray = [11,22,4,89,90,100,323,99,33,0,34,56]
        
        quickSort(object: &intArray,ascending: false)
        
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
    func testPreRecursive() {
         let tree = SearchTree.init([0,1,2,3,4,5])
       
        tree.preOrderRecursive(tree.root!)
        print("start")
        tree.preOrderNoneRecursive(tree.root!)
 print("end")

        
        
    }
    
    func testPostRecursive() {
        let tree = SearchTree.init([0,1,2,3,4,5])
        
        tree.postOrderRecursive(tree.root!)
        print("start")
        tree.postOrderNoneRecursive(tree.root!)
        print("end")

        
    }
    func testInRecursive() {
        let tree = SearchTree.init([0,1,2,3,4,5])
        
        tree.inOrderRecursive(tree.root!)
        print("start")
        tree.inOrderNoneRecursive(tree.root!)
        print("end")
        
        
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
