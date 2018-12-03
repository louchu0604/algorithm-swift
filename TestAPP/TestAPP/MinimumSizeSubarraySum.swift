//
//  MinimumSizeSubarraySum.swift
//  TestAPP
//
//  Created by 楼楚 on 2018/12/3.
//  Copyright © 2018年 Cy Lou. All rights reserved.
//

import Foundation
func sizeofsunarraysum( array:inout[Int],target: Int)-> Int
{
    var left = 0
    var right = 0
    var lastLength = array.count
    var sum = 0
    
    while right < array.count && left < array.count{
        sum += array[right]
        if(sum<target)
        {
           
        }
    }
    
    
    return 0
}
