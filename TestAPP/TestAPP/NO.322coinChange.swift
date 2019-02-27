//
//  coinChange.swift
//  TestAPP
//
//  Created by louchu on 2019/2/26.
//  Copyright © 2019年 Cy Lou. All rights reserved.
//

import Foundation
//MARK: 钱币找零问题
/*
 给定不同面额的硬币 coins 和一个总金额 amount。编写一个函数来计算可以凑成总金额所需的最少的硬币个数。如果没有任何一种硬币组合能组成总金额，返回 -1。
 输入: coins = [1, 2, 5], amount = 11
 输出: 3
 解释: 11 = 5 + 5 + 1
 */
func coinChange(_ coins: [Int], _ amount: Int) -> Int {
//    先将coins内的元素排序
    var newCoins = coins
     newCoins.sort(){$0 > $1}
//    先用最大的元素占满
    var useCoin = [Int](repeating: 0, count: newCoins.count)//记录使用数量的数组
    var remain = amount //剩余未兑换的钱
    var doing = true //是否在计算过程中
    var coinCount = 0
    var index = newCoins.count-1
    while remain==0 || doing {
        
          let useNumber = remain/newCoins[index]
        useCoin[index] = useNumber ; 
        coinCount += useNumber;
        remain -= useNumber * newCoins[index];
        if(index>0)
        {
            index-=1
        }
        
    }
    
    if(remain==0)
    {
        return coinCount
    }
    return -1
}
/// 贪心算法的思路实现 greedy algorithm
///
/// - Parameters:
///   - orginalCount: 用掉的纸币张数
///   - orginalCountArray: 剩余纸币数量（ 1元、2元、5元、10元、20元、50元、100元 的纸币剩余数量倒置在此数组中）
///   - restMoney: 剩余未兑换的钱
/// - Returns: 如果有结果，返回用掉的纸币张数 没有结果 返回null
func greedyindMinCount(_ orginalCount: inout Int,_ orginalCountArray: inout [Int],_ restMoney:inout Int)->Int?{
    let moneyArray = [100,50,20,10,5,2,1]
    
    
    
    for index in 0..<orginalCountArray.count {
        
        if (moneyArray[index] <= restMoney && orginalCountArray[index] > 0 )
        {
            //                取整
            let useNumber = restMoney/moneyArray[index]
            if(useNumber <= orginalCountArray[index])
            {
                print("用掉面额为",moneyArray[index],"元的人民币",useNumber,"张")
                restMoney = restMoney - useNumber*moneyArray[index]
                orginalCountArray[index] =  orginalCountArray[index] - useNumber
                orginalCount = orginalCount + useNumber
                
                
            }else
            {
                print("用掉面额为",moneyArray[index],"元的人民币",orginalCountArray[index],"张")
                restMoney = restMoney - orginalCountArray[index]*moneyArray[index]
                orginalCountArray[index] =  0
                orginalCount = orginalCount + orginalCountArray[index]
                
                
            }
            
        }
        if(restMoney == 0)
        {
            break
        }
        
        
    }
    
    
    if(restMoney == 0)
    {
        print("总共需要人民币",orginalCount,"张")
        return orginalCount
    }
    
    print("还剩",restMoney,"元，无法解决")
    return nil
}
