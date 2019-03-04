//
//  NO.11maxArea.swift
//  TestAPP
//
//  Created by louchu on 2019/3/4.
//  Copyright © 2019年 Cy Lou. All rights reserved.
//

import Foundation
//MARK: 盛最多水的容器
/*
 给定 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0)。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。
 
 说明：你不能倾斜容器，且 n 的值至少为 2。
 
 
 
 图中垂直线代表输入数组 [1,8,6,2,5,4,8,3,7]。在此情况下，容器能够容纳水（表示为蓝色部分）的最大值为 49。
 
 输入: [1,8,6,2,5,4,8,3,7]
 输出: 49
 */
func maxArea(_ height: [Int]) -> Int {
    //    暴力法
    var maxHeight = 0
    var left=0
    var right = height.count-1
    while left<right {
//        let length = right-left
//
//        if(height[right]<height[left])
//        {
//            tmpArea = height[right]*length
//            right -= 1
//        }else
//        {
//             tmpArea = height[left]*length
//             left += 1
//        }
//        if(tmpArea>maxHeight)
//        {
//            maxHeight = tmpArea
//        }
          maxHeight = max(maxHeight,min(height[right],height[left]) * (right - left))
        if(height[right]<height[left])
        {
            right -= 1
        }else
        {
             left += 1
        }
        
        
    }
    
    return maxHeight
}
func maxArea0(_ height: [Int]) -> Int {
//    暴力法
    var maxHeight = 0
    var tmpArea = 0
    for i in 0..<height.count
    {
        for j in i..<height.count
        {
            let a = j-i
           
            if(height[j]>height[i])
            {
              tmpArea = a*height[i]
                if(tmpArea>maxHeight)
                {
                    maxHeight = tmpArea
                }
            }else
            {
                tmpArea = a*height[j]
                if(tmpArea>maxHeight)
                {
                    maxHeight = tmpArea
                }
            }
        }
    }
    
    return maxHeight
}
