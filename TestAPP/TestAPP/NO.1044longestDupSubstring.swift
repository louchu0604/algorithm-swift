//
//  NO.1044longestDupSubstring.swift
//  TestAPP
//
//  Created by 楼楚 on 2019/6/16.
//  Copyright © 2019年 Cy Lou. All rights reserved.
//

import Foundation

func longestDupSubstring(_ S: String) -> String {
    var min = 1
    var max = S.count
    var lastDup = ""
    var middel = (Int)(Double(min) * 0.5 + Double(max) * 0.5)//二分
    var resArray =  [[String]](repeating:[String](), count: 26*26)
    print(" start")
    while true {//find - break
    resArray =  [[String]](repeating:[String](), count: 26*26)
        
//        print("finding","min:",min,"max:",max,"middle:",middel)
        let checkTimes = S.count - middel + 1
        var find = false
        for i in 0..<checkTimes {
            
            let startIndex = S.index(S.startIndex, offsetBy: i)
            let endIndex =  S.index(startIndex, offsetBy:middel)
           
            let newStr = String(S[startIndex..<endIndex]) ?? ""
//            判重需要重写
            if(newStr.count>0)
            {
//该字符串的长度是middel 我们取第一个字符串和最后的字符串作为key
//    key的计算方法为第一个字符串+26*最后一个字符串
                
                let index = charToInt(newStr.first!)+26*charToInt(newStr.last!)
                if(hasDup(newStr, &resArray, index))
                {
                    lastDup = newStr
//                    print(lastDup)
                    min = middel+1//扩大范围
                    find = true
                    break
                }
            }
        }
       //能走到这里说明没有重复的字符串 那么需要缩小范围
        if(max<=min)
        {
            break
        }
        if(!find)//
        {
            max = middel-1
        }
        if(max-min==1)
        {
            middel = max
        }else
        {
            middel = (Int)(Double(min) * 0.5 + Double(max) * 0.5)
        }
    }
    print(lastDup)
    return lastDup
}
func charToInt(_ char:Character)->Int
{
    //转换成character字符
   
    for i in 0..<26 {
        let ii = 97+i
        let character = Character(UnicodeScalar(ii)!)
        if(character == char)
        {
            return i
        }
    }
    return 0
}
func hasDup(_ s:String,_ res:inout [[String]], _ index:Int) ->Bool{
    
//    判断数组是否为空
   if(res[index].count==0)
   {
    res[index].append(s)
     return false
    }else
   {
    
        for i in 0..<res[index].count
        {
           
           if(s==res[index][i])
           {
            return true
            }
        }
        res[index].append(s)//没有macth 就添加
    }
    
    return false
   
}

