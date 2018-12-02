//
//  moveZeros.swift
//  TestAPP
//
//  Created by 楼楚 on 2018/12/2.
//  Copyright © 2018年 Cy Lou. All rights reserved.
//

import Foundation

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
    
    return array
}
