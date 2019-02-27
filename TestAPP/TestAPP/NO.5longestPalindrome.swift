//
//  NO.5longestPalindrome.swift
//  TestAPP
//
//  Created by louchu on 2019/2/27.
//  Copyright © 2019年 Cy Lou. All rights reserved.
//

import Foundation
//MARK: 最长回文子串
/*
 
 给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。
 */

func longestPalindrome0226(_ s: String) -> String {
    
    if(s.count < 2)
    {
        return s
    }
    var matrix = [Bool](repeating: false, count: s.count*s.count)
    //matrix[i*s.count+j]表示s[i-j]是否为回文字符串的结果  false:不是 true:是
    var strArray = Array(s)
    var resultArray = [0,0]
    var lastValue = 0
    
    for strLength in 1..<strArray.count+1 {
        
        let leftMaxIndex = strArray.count-strLength+1
        for i in 0..<leftMaxIndex {
            let j = i+strLength-1
            
            if(strArray[i]==strArray[j])
            {
                let tmpidx = i*strArray.count
                let stepL = j-i
                if(stepL>=2)
                {
                    
                    let result = matrix[tmpidx+strArray.count+j-1]
                    if(result == true)
                    {
                        matrix[tmpidx+j] = true
                        if(stepL>lastValue)
                        {
                            resultArray[0] = i
                            resultArray[1] = j
                            lastValue = stepL
                        }
                    }
                    
                }else
                {
                    matrix[tmpidx+j] = true
                    if(stepL>lastValue)
                    {
                        resultArray[0] = i
                        resultArray[1] = j
                        lastValue = stepL
                    }
                }
                
            }
        }
    }
    
    let start = resultArray[0]
    let end = resultArray[1]+1
    var resultArray1 = Array <Character> ()
    for i in start..<end {
        
        resultArray1.append(strArray[i])
        
    }
    return String(resultArray1);
    
}

func longestPalindromeold(_ s: String) -> String {
    var strArray = Array(s)
    if(strArray.count == 0)
    {
        return ""
    }
    if(strArray.count == 1 )
    {
        return s
    }
    
    var resultArray = Array <Character> ()
    resultArray.append(strArray[0])
    let scount = strArray.count
    
    for index in 1..<scount {
        var tmp0 = Array <Character> ()
        var tmp1 = Array <Character> ()
        if(index-1>=0&&strArray[index] == strArray[index-1])
        {
            var a=1;
            
            tmp0.append(strArray[index])
            tmp0.append(strArray[index-1])
            
            while(index-a-1>=0 && index+a<scount)
            {
                if(strArray[index-a-1] == strArray[index+a])
                {
                    
                    tmp0.append(strArray[index+a])
                    tmp0.insert(strArray[index-a-1], at: 0)
                    
                    
                }else
                {
                    break;
                }
                
                a += 1
            }
            
        }
        if(index-1>=0 && index+1 < scount && strArray[index-1] == strArray[index+1])
        {
            var a=1;
            tmp1.append(strArray[index-1])
            tmp1.append(strArray[index])
            tmp1.append(strArray[index-1])
            while(index-a-1>=0 && index+a+1<scount)
            {
                if(strArray[index-a-1] == strArray[index+1+a])
                {
                    
                    tmp1.append(strArray[index+1+a])
                    tmp1.insert(strArray[index-a-1], at: 0)
                    
                }else
                {
                    break;
                }
                
                a += 1
            }
            
            
        }
        if(tmp0.count>=tmp1.count && tmp0.count>=resultArray.count)
        {
            resultArray = tmp0
        }
        if(tmp0.count < tmp1.count && tmp1.count>=resultArray.count)
        {
            resultArray = tmp1
        }
        
    }
    
    return String(resultArray);
    
}

func longestPalindrome(_ s: String) -> String {
    
    if(s.count < 2)
    {
        return s
    }
    var matrix = [Bool](repeating: false, count: s.count*s.count)
    //matrix[i*s.count+j]表示s[i-j]是否为回文字符串的结果  false:不是 true:是
    var strArray = Array(s)
    var resultArray = [0,0]
    var lastValue = 0
    
    for strLength in 1..<strArray.count+1 {
        
        let leftMaxIndex = strArray.count-strLength+1
        for i in 0..<leftMaxIndex {
            let j = i+strLength-1
            
            if(strArray[i]==strArray[j])
            {
                let tmpidx = i*strArray.count
                let stepL = j-i
                if(stepL>=2)
                {
                    
                    let result = matrix[tmpidx+strArray.count+j-1]
                    if(result == true)
                    {
                        matrix[tmpidx+j] = true
                        if(stepL>lastValue)
                        {
                            resultArray[0] = i
                            resultArray[1] = j
                            lastValue = stepL
                        }
                    }
                    
                }else
                {
                    matrix[tmpidx+j] = true
                    if(stepL>lastValue)
                    {
                        resultArray[0] = i
                        resultArray[1] = j
                        lastValue = stepL
                    }
                }
                
            }
        }
    }
    
    let start = resultArray[0]
    let end = resultArray[1]+1
    var resultArray1 = Array <Character> ()
    for i in start..<end {
        
        resultArray1.append(strArray[i])
        
    }
    return String(resultArray1);
    
}



