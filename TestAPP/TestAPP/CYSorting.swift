//
//  CYSorting.swift
//  TestAPP
//
//  Created by louchu on 2018/11/6.
//  Copyright © 2018年 Cy Lou. All rights reserved.
//

import Foundation
struct Sorting <Int>{
    var list:[NSInteger]
    var result:[NSInteger]
    init(object:[NSInteger]) {
        list = object
        result = [NSInteger]()
    }
    mutating func setList(object:[NSInteger])
    {
        list = object
    }
    mutating func bubbleSort(object:inout [NSInteger] , ascending:Bool)
    {
        result.removeAll()
        let end = object.count-1
       
       
        //倒序遍历数组
        for index in (0...end).reversed() {
                for i in 0..<index {
                    let next = i+1
                    let thisItem = object[i]
                    let nextItem = object[i+1]
                   if(ascending)//升序
                   {
                    
                    if thisItem > nextItem {
                       
                        object[i] = object[i+1]
                        object[i+1] = thisItem
                        }
                   }else//降序
                   {
                    if thisItem < nextItem {
                    
                        object[i] = object[i+1]
                        object[i+1] = thisItem
                    }
                    
                    }
                }
        }
        
        print(object)
    }
}
//冒泡 时间复杂程度 n^2
func bubbleSort(object:inout [NSInteger] , ascending:Bool)
{
    let end = object.count-1
    
    
    //倒序遍历数组
    for index in (0...end).reversed() {
        for i in 0..<index {
            let next = i+1
            let thisItem = object[i]
            let nextItem = object[i+1]
            if thisItem > nextItem {
                
                object[i] = object[i+1]
                object[i+1] = thisItem
            }
            
        }
    }
    
    print(object)
}
//简单的插入排序 最差情形 n^2
func insertSort(object:inout [NSInteger] , ascending:Bool){
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
func selectSort(object:inout [NSInteger] , ascending:Bool){
    var result = Array <NSInteger>()

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

//快速排序
func quickSort(object:inout [NSInteger] , ascending:Bool){

   
}
