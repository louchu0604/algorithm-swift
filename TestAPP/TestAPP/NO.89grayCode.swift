//
//  NO.89grayCode.swift
//  TestAPP
//
//  Created by louchu on 2019/3/4.
//  Copyright © 2019年 Cy Lou. All rights reserved.
//

import Foundation
//MARK: 格雷编码
/*
 格雷编码是一个二进制数字系统，在该系统中，两个连续的数值仅有一个位数的差异。
 
 给定一个代表编码总位数的非负整数 n，打印其格雷编码序列。格雷编码序列必须以 0 开头。
 
 输入: 2
 输出: [0,1,3,2]
 解释:
 00 - 0
 01 - 1
 11 - 3
 10 - 2
 
 对于给定的 n，其格雷编码序列并不唯一。
 例如，[0,2,3,1] 也是一个有效的格雷编码序列。
 
 00 - 0
 10 - 2
 11 - 3
 01 - 1
 */

func grayCode(_ n: Int) -> [Int] {
    if(n<=0)
    {
        return [0]
    }
 
    var result = [Int](repeating: 0, count: 1<<n)//初始化 都为0
    let border = n+1
    for index in 1..<border
    {
        let tmp0 = index - 1
        let addlength = 1<<tmp0
        for tmpindex in 0..<addlength
        {
            result[2*addlength-tmpindex-1] = addlength+result[tmpindex]
        }
    }
    
    return result
    
    
    
    
    
}
