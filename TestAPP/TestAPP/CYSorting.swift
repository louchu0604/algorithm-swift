//
//  CYSorting.swift
//  TestAPP
//
//  Created by louchu on 2018/11/6.
//  Copyright © 2018年 Cy Lou. All rights reserved.
//

import Foundation

//冒泡 时间复杂程度 n^2
func bubbleSort(object:[Int] , ascending:Bool)
{
    let end = object.count-1
    
    var result =  Array <Int>()
    result = object
    //倒序遍历数组
    for index in (0...end).reversed() {
        for i in 0..<index {
            let thisItem = result[i]
            let nextItem = result[i+1]
            if thisItem > nextItem {
                
                result[i] = result[i+1]
                result[i+1] = thisItem
            }
            
        }
    }
    
    print(result)
}
//简单的插入排序 最差情形 n^2
func insertSort(object:[Int] , ascending:Bool){
     var result = Array <NSInteger>()
    for item in object {
        var compareidx = result.count-1
        
        while(compareidx==0||result[compareidx]>item)
        {
             compareidx-=1
        }
        result.insert(item, at: compareidx+1)
    }
     print(result)
    
}
//选择排序 时间复杂程度 n^2
func selectSort(object:[Int] , ascending:Bool){
    var result = Array <Int>()

    //遍历数组
    for index in 0..<object.count{
        var minIdx = index
        for i in 0..<index {
            let thisItem = object[i]
            let nextItem = object[i+1]
            if thisItem < nextItem {
                
                minIdx = i
            }
            
        }
        result.append(object[minIdx])
    }

    print(result)
    
}

//快速排序 默认基准值都选第一个 basic:数字都不相同
func quickSort(object:inout [Int] , ascending:Bool){
   
//    var result = quickSortTwoSides(object: object, startIndex: 0, endIndex: object.count-1);
    var result = quickSortTwoSides(object: &object, startIndex: 0, endIndex: object.count);
     let end = result.count-1
    if ascending {
       
        //倒序遍历数组
        for (_,value) in result.enumerated(){
            
            
            
            print(value)
            
        }
       
    }else
    {
        
        
        for (_,value) in result.enumerated().reversed() {
            
            
            
            print(value)
            
        }
        
    }
    print(result)
    
   
}
//升序 小的都移到前面
func quickSortTwoSides(object:inout [Int],startIndex:Int!,endIndex:Int!)->[Int]{
    
    var moveCount = 0;
    let baseItem = object[startIndex]
    for index in startIndex..<endIndex{
        if object[index] < baseItem
        {
            let moveitem = object[index]
            object.remove(at: index)
            object.insert(moveitem, at: startIndex)
            moveCount+=1
            
        }
        
    }
    if moveCount>1 {//left
        quickSortTwoSides(object: &object, startIndex: startIndex, endIndex:startIndex+moveCount)
    }
    if endIndex-startIndex+1-1-moveCount>2//right
    {
         quickSortTwoSides(object: &object, startIndex: startIndex+moveCount+1, endIndex: endIndex)
    }
    
    //
    return object;
    
}

