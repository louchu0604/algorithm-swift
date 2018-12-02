//
//  moveZeros.swift
//  TestAPP
//
//  Created by 楼楚 on 2018/12/2.
//  Copyright © 2018年 Cy Lou. All rights reserved.
//

import Foundation
// remove zeros to the end of an array
// 1 more space
func moveZeros(array: inout [Int]) -> [Int] {
    print("before",array);
    var resultArray = Array <Int>()
    var zeroCount = 0
   
    for index in 0..<array.count {

        let item = array[index]
        if(item == 0)
        {
            zeroCount += 1
        }else
        {
            resultArray.append(item)
        }
    }
    for i in 0..<zeroCount
    {
        resultArray.append(0)
    }
    print("after",resultArray);
    
    return resultArray
}
//use while ,no more space
func moveZeros2(array: inout [Int]) -> [Int] {
    print("before",array);
    var idx = 0
    var count = 0
    while idx < array.count && count < array.count {
        count += 1
        let item = array[idx]
        if(item == 0)
        {
            array.remove(at: idx)
            array.append(0)
            
        }else
        {
            idx += 1
        }
    }
 
    print("after",array);
    return array
}
