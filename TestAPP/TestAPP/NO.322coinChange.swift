//
//  coinChange.swift
//  TestAPP
//
//  Created by louchu on 2019/2/26.
//  Copyright © 2019年 Cy Lou. All rights reserved.
//

import Foundation
//    元素排序
//    var newCoins = ...
//     newCoins.sort(){$0 > $1}


//MARK: 钱币找零问题
/*
 给定不同面额的硬币 coins 和一个总金额 amount。编写一个函数来计算可以凑成总金额所需的最少的硬币个数。如果没有任何一种硬币组合能组成总金额，返回 -1。
 输入: coins = [1, 2, 5], amount = 11
 输出: 3
 解释: 11 = 5 + 5 + 1
 */
func coinChange(_ coins: [Int], _ amount: Int) -> Int {
//        if(amount==0)
//        {
//            return 0
//        }
//    if(amount<0)
//    {
//        return -1
//    }

//    if(coins.count==0)
//    {
//        return -1
//    }
    var tmpuse = [Int](repeating: 0, count: amount+1) // tmpuse[i]:记录凑齐i元需要的硬币数量
    let maxCountFull = amount+1
    for aimMoney in 1..<maxCountFull
    {
        tmpuse[aimMoney] = amount + 1
        for cindex in 0..<coins.count//凑齐aimMoney需要的硬币数量
        {
            let diff = aimMoney - coins[cindex]//如果要使用这张硬币，则根据要凑的数目与这张硬币的差值，算出可能已经凑好的部分
            if(diff<0)//硬币面值过大  跳过这张不可能的s硬币
            {
                continue
            }
            let newUseNumber = tmpuse[diff] + 1 //使用一张
            if(newUseNumber < tmpuse[aimMoney])//更新：凑齐aimMoney的更少硬币数量
            {
                tmpuse[aimMoney] = newUseNumber
            }
        }
    }
 
    return tmpuse[amount] < amount + 1  ? tmpuse[amount] : -1
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
