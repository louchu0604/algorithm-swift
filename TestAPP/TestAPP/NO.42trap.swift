//
//  NO.42trap.swift
//  TestAPP
//
//  Created by louchu on 2019/3/4.
//  Copyright © 2019年 Cy Lou. All rights reserved.
//

import Foundation
//MARK: 接雨水
/*
给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。
 上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。 感谢 Marcos 贡献此图。
 
 示例:
 
 输入: [0,1,0,2,1,0,1,3,2,1,2,1]
 输出: 6
 
 */
func trap(_ height: [Int]) -> Int {
    var maxArray = findMax(height)
    
    var area = 0
    for index in 0..<height.count
    {
        area +=  min(maxArray[index], maxArray[index+height.count]) - height[index]
        
    }
    
    return area
    
    
}
func findMax(_ height:[Int]) ->([Int])
{
    var  maxArray = [Int](repeating: 0, count: height.count*2)
    var leftStartMax = 0
    var rightStartMax = 0
    for index in 0..<height.count
    {
        maxArray[index] = max(height[index], leftStartMax)
        leftStartMax = maxArray[index]
    }
    for index in (0 ..< height.count).reversed() {
        maxArray[index+height.count] = max(height[index], rightStartMax)
        rightStartMax = maxArray[index+height.count]
    }
    return maxArray
}

func trap1(_ height: [Int]) -> Int {

    var area = 0
    var unsolved = [Int]()
    var max = -1
    for index in 0..<height.count
    {
       if(max<0)//init
       {
        max = height[index]
       }else if((height[index]==max && index==height.count-1) || height[index]>max)
       {
          area += max * unsolved.count - unsolved.reduce(0, +)
        
           unsolved.removeAll()
           max = height[index]//reset max
        
        }
        unsolved.append(height[index])
    
        
    }
    if(unsolved.count>2)
    {
         var unsolved2 = [Int]()
         max = -1
        unsolved = unsolved.reversed()
        
        for index in 0..<unsolved.count
        {
            
            if(max<0)//init
            {
                max = unsolved[index]
        
            }else if((unsolved[index]==max && index==unsolved.count-1) || unsolved[index]>max)
            {
                area += max * unsolved2.count - unsolved2.reduce(0, +)
                unsolved2.removeAll()
                max = unsolved[index]//reset max
                
            }
            unsolved2.append(unsolved[index])
        }
        
    }
    
    
    return area
}

func trap0(_ height: [Int]) -> Int {
//    暴力法
   
    var newHeight = height
    var area = 0
    while newHeight.count>0 {
       
     
        var canDo = true
        while canDo
        {
            if(newHeight.count>0&&newHeight[0]==0)//第一个是0
            {
               newHeight.remove(at: 0)
            
                
            }else if(newHeight.count>0&&newHeight[newHeight.count-1]==0)// 最后一个是o0
            {
                newHeight.remove(at:newHeight.count-1)
                
            }else
            {
                canDo = false
            }
        }
        for index in 0..<newHeight.count
        {
            
            if(newHeight[index]==0)
            {
                area += 1
            }else
            {
                newHeight[index] -= 1
            }
            
        }
        
       
    }
 
    
    return area
}
