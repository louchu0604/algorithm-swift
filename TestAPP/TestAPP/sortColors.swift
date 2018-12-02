//
//  sortColors.swift
//  TestAPP
//
//  Created by 楼楚 on 2018/12/2.
//  Copyright © 2018年 Cy Lou. All rights reserved.
//

import Foundation
//sort by 0,1,2(red white blue)
func sortColorFunc1( array : inout [Int]) -> [Int]
{
    print("before",array)
    var resultArray = Array <Int>()
    var redArray = Array <Int>()
    var whiteArray = Array <Int>()
    var blueArray = Array <Int>()
    for index in 0..<array.count {
        switch(array[index])
        {
        case 0:
            redArray.append(0)
            break;
        case 1:
            whiteArray.append(1)
            break;
        case 2:
            blueArray.append(2)
            break;
        default:
            
            print("find illegle")
            break;
        }
    }
    resultArray += redArray
    resultArray += whiteArray
    resultArray += blueArray

    print("after",resultArray)
    
    
    return resultArray
}
func sortColorFunc2( array : inout [Int]) -> [Int]
{
    print("before",array)
    
    var left = 0
    var right = array.count-1
    var counted = 0

    while left <= right && counted < array.count{
        
        counted += 2
        let leftitem = array[left]
        let rightitem = array[right]
        if(leftitem == 0)
        {
            array.remove(at: left)
            array.insert(0, at: 0)
            left += 1
        }else if (leftitem == 2)
        {
            array.remove(at: left)
            array.append(2)
            right -= 1
        }else
        {
            left += 1
        }
        
        if(rightitem == 0)
        {
            array.remove(at: right)
            array.insert(0, at: 0)
            left += 1
            
        }else if (rightitem == 2)
        {
            array.remove(at: right)
            array.append(2)
            right -= 1
            
        }else
        {
            right -= 1
        }
    }
 
    
    print("after",array)
    
    
    return array
}
