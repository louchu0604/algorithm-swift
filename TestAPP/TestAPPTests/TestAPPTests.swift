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
    func testChangeAl()
    {
        var orginalCountArray = [6,6,6,6,6,6,6];
        var orginalCount = 0
        var restMoney = 442

        var usecount =  greedyFindMinCount(&orginalCount,&orginalCountArray,&restMoney)
        
// XCTAssertEqual(usecount,22 )
        
        
    }
    func testSignString(){
        let result = correctSignature("{}{()}{}[]")
         XCTAssertEqual(result, true)
        let result2 = correctSignature("{}{(}{}[]")
        XCTAssertEqual(result2, false)
    }
    func testReversePolishNotation()
    {

        
      let result =   reversePolishNotation(["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"])
        XCTAssertEqual(result,22 )
    }
    func testLinkedList() {
        let list  = LinkedList.init()
        list.appendArrayToTail(array:[1,2,3,4,5])
        list.printList()
       list.oddEvenLinkedList()
        list.printList()
    }
    func testReverse()
    {
        var str = "heazxcvbnm,"
        let result = reverseString(str:&str)
    XCTAssertEqual(result, ",mnbvcxzaeh")
    }
    func testcontainDup()
    {
        let result =   containsDuplicateII(array:[1,2,3,0,1],target:3)
        XCTAssertTrue(result)

    }
    func testBoom()
    {
     let result = numberOfBoomerangs(points:[[0,0],[1,0],[2,0]])
        XCTAssertEqual(result, [[[1, 0], [0, 0], [2, 0]], [[1, 0], [2, 0], [0, 0]]])
    }
    func  testintersection() {
//        intersectionOfTwoArrays(array1:[7,7,8,9],array2:[3,4,5,2])
        var  array1 = [7,7,8,9];
        var  array2 = [3,4,5,2,7,7,8];
        let result = intersectionOfTwoArrays2(array1:&array1,array2:&array2)
        XCTAssertEqual(result, [7, 8])

    }
    func testSubArraySum() {
        
        let  array1 = [1,2,3,10,4,5,6,7,8,9];
        let result = sizeofsunarraysum(array: array1,target: 11)
         XCTAssertEqual(result,2)
    }
    func testtwosum()
    {
        let array1 = [0,1,2,6,7,8,9,10];
        let result = twosumofarray(array: array1,target: 17)
          XCTAssertEqual(result,[4, 7])
    }
    func testMoveZeros() {
        var array1 = [0,1,0,2,0,0,0,33,44,88,0];
        let result = moveZeros(array: &array1);
        XCTAssertEqual(result,[1, 2, 33, 44, 88, 0, 0, 0, 0, 0, 0])

        let result2 = moveZeros2(array: &array1);
        XCTAssertEqual(result2,[1, 2, 33, 44, 88, 0, 0, 0, 0, 0, 0])

    }
    func testsortColors() {
        var  array1 = [0,1,0,2,0,0,0,1,2,1,0,2,2,1,0,0];
        let result = sortColorFunc2(array: &array1);
         XCTAssertEqual(result,[0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2])
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
        tree.delete(3, tree.root!,tree.root!);
        let maxvalue = tree.findMax(tree.root!)
        XCTAssertEqual(maxvalue, 2)
        
        
    }

    
}
