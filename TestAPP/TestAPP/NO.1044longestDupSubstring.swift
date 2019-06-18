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
    var resArray =  [[[Character]]](repeating:[[Character]](), count: 26*26)
//    先把这个字符串修改成一个数组
    var sArray =  Array(S)
 
    print(" start")
    while true {//find - break
        print("loop:",Date())
        
    resArray =  [[[Character]]](repeating:[[Character]](), count: 26*26)
        
//        print("finding","min:",min,"max:",max,"middle:",middel)
        let checkTimes = S.count - middel + 1
        var find = false
        for i in 0..<checkTimes {
//            截取字符串
//            let startIndex = S.index(S.startIndex, offsetBy: i)
//            let endIndex =  S.index(startIndex, offsetBy:middel)
           
//            let newStr = String(S[startIndex..<endIndex]) ?? ""
//            let eend = i+middel
            let thisarray = sArray[i..<(i+middel)]
            let newStr = String(thisarray)
//            判重需要重写
            if(newStr.count>0)
            {
//该字符串的长度是middel 我们取第一个字符串和最后的字符串作为key
//    key的计算方法为第一个字符串+26*最后一个字符串
                
                let index = charToInt(sArray[i],sArray[i+middel-1])
//                if(hasDup(newStr, &resArray, index))
                    if(hasDupCharStr(sArray,thisarray, &resArray, index))
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
func charToInt(_ charA:Character,_ charB:Character)->Int
{
//    let strA = String([charA])
//    let strB = String([charB])
//    let dic = {}
//    "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"
    //转换成character字符
    var x = -1
    var y = -1
   
    for i in 0..<26 {
        let ii = 97+i
        let character = Character(UnicodeScalar(ii)!)
        if(character == charA)
        {
            x = i
            if(y>=0)
            {
                 return x+y*26
            }
        }
        if(character == charB)
        {
            y = i
            if(x>=0)
            {
                return x+y*26
            }
        }
        
    }
    return 0
}
func hasDupCharStr(_ charStr:[Character],_ subcharStr:ArraySlice<Character>,_ res:inout [[[Character]]], _ index:Int) ->Bool{
    
    //    判断数组是否为空
    let rescount = res[index].count
    if(rescount==0)
    {
        res[index].append(charStr)
        return false
    }else
    {
//        在该组中匹配
        for i in 0..<rescount
        {
           if(subcharStr.count<=2)
           {
            return true
            }else
           {
//            let aaa = subcharStr.count
//            let bbb = res[index][i].count
//            let aa = subcharStr[1]
//
//            let bb = res[index][i][1]
            if(subcharStr[2] == res[index][i][2])
            {
                if(String(subcharStr) == String(res[index][i]))
                {
                     return true
                }
            }
            }
        }
        res[index].append(charStr)//没有macth 就添加
    }
    
    return false
    
}


func hasDup(_ s:String,_ res:inout [[String]], _ index:Int) ->Bool{
    
//    判断数组是否为空
    let rescount = res[index].count
   if(rescount==0)
   {
    res[index].append(s)
     return false
    }else
   {
    
        for i in 0..<rescount
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

