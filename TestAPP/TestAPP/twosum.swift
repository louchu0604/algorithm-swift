//
//  twosum.swift
//  TestAPP
//
//  Created by louchu on 2018/12/3.
//  Copyright © 2018年 Cy Lou. All rights reserved.
//

import Foundation
//leetcode No.167
//accept ascending order array
func twosum(array: inout [Int],target: Int) -> [Int]?
{
    print("array:",array,"target:",target)
    var left = 0
    var right = array.count-1
    var find = false
    while left<right {
        let result = array[left]+array[right]
        if(result==target)
        {
            find = true
            break;
        }else if(result>target)
        {
            right -= 1
        }else
        {
            left += 1
        }
    }
    
    if find {
        print("find:",[left,right])
        return [left,right]
    }else
    {
         print("can not find")
        return nil
    }
    
    
}

