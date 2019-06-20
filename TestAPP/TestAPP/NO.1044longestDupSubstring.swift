//
//  NO.1044longestDupSubstring.swift
//  TestAPP
//
//  Created by 楼楚 on 2019/6/16.
//  Copyright © 2019年 Cy Lou. All rights reserved.
//

import Foundation

class Solution {
    func longestDupSubstring(_ S: String) -> String {
        var sa:[Int] = suffixArray(Array(S), 26)
        let n:Int = S.count
        var lcp:[Int] = buildLCP(Array(S), sa)
        var isa:[Int] = [Int](repeating:0,count:n)
        for i in 0..<n {isa[sa[i]] = i}
        var max:Int = 0
        var arg:Int = -1
        for i in 1..<n
        {
            if lcp[i] > max
            {
                max = lcp[i]
                arg = i
               
            }
        }
        if arg == -1 {return String()}
        return S.subString(sa[arg], max + 1)
    }
    
    func buildLCP(_ str:[Character],_ sa:[Int]) -> [Int]
    {
        let n:Int = str.count
        var h:Int = 0
        var lcp:[Int] =  [Int](repeating:0,count:n)
        var isa:[Int] = [Int](repeating:0,count:n)
        for i in 0..<n {isa[sa[i]] = i}
        for i in 0..<n
        {
            if isa[i] > 0
            {
                let j:Int = sa[isa[i] - 1]
                while(j+h < n && i+h < n && str[j+h] == str[i+h])
                {
                    lcp[isa[i]] = h
                    h += 1
                }
            }
            else
            {
                lcp[isa[i]] = 0
            }
            if h > 0 {h -= 1}
        }
        return lcp
    }
    
    func suffixArray(_ str:[Character],_ W:Int) -> [Int]
    {
        let n:Int = str.count
        if n <= 1 {return [Int](repeating:0,count:n)}
        var sa:[Int] = [Int](repeating:0,count:n)
        var s:[Int] = [Int](repeating:0,count:n + 3)
        for i in 0..<n
        {
            s[i] = str[i].ascii - 96//对应成ascii 再将值域缩小到从0开始
        }
        suffixArray(s, &sa, n, W+1)
        return sa
    }
    
    func suffixArray(_ s:[Int],_ sa:inout [Int],_ n:Int,_ K:Int)
    {
        let n0:Int = (n+2)/3
        let n1:Int = (n+1)/3
        let n2:Int = n/3
        let n02:Int = n0 + n2
        
        var s12:[Int] = [Int](repeating:0,count:n02 + 3)
        var sa12:[Int] = [Int](repeating:0,count:n02 + 3)
        var s0:[Int] = [Int](repeating:0,count:n0)
        var sa0:[Int] = [Int](repeating:0,count:n0)
        
        // generate positions of mod 1 and mod 2 suffixes
        // the "+(n0-n1)" adds a dummy mod 1 suffix if n%3 == 1
        let sup:Int = n + (n0 - n1)
        var i1:Int = 0
        var j1:Int = 0
        while(i1 < sup)
        {
            if i1 + 1 < sup {
                s12[j1] = i1 + 1
                j1 += 1
            }
            if i1 + 2 < sup {
                s12[j1] = i1 + 2
                j1 += 1
            }
            i1 += 3
        }
        
        // lsb radix sort the mod 1 and mod 2 triples
        radixPass(s12, &sa12, s, 2, n02, K)
        radixPass(sa12, &s12, s, 1, n02, K)
        radixPass(s12, &sa12, s, 0, n02, K)
        
        // find lexicographic names of triples
        var name:Int = 0
        var c0:Int = -1
        var c1:Int = -1
        var c2:Int = -1
        
        for i in 0..<n02
        {
            if s[sa12[i]] != c0 || s[sa12[i]+1] != c1 || s[sa12[i]+2] != c2
            {
                name += 1
                c0 = s[sa12[i]]
                c1 = s[sa12[i]+1]
                c2 = s[sa12[i]+2]
            }
            if sa12[i] % 3 == 1
            {
                // left half
                s12[sa12[i]/3] = name
            }
            else
            {
                // right half
                s12[sa12[i]/3 + n0] = name
            }
        }
        
        // recurse if names are not yet unique
        if name < n02
        {
            suffixArray(s12, &sa12, n02, name)
            // store unique names in s12 using the suffix array
            for i in 0..<n02
            {
                s12[sa12[i]] = i + 1
            }
        }
        else
        {
            // generate the suffix array of s12 directly
            for i in 0..<n02
            {
                sa12[s12[i]-1] = i
            }
        }
        
        // stably sort the mod 0 suffixes from sa12 by their first character
        var i2:Int = 0
        var j2:Int = 0
        while(i2 < n02)
        {
            if sa12[i2] < n0
            {
                s0[j2] = 3 * sa12[i2]
                j2 += 1
            }
            i2 += 1
        }
        radixPass(s0, &sa0, s, 0, n0, K)
        
        // merge sorted sa0 suffixes and sorted sa12 suffixes
        var p:Int = 0
        var t:Int = n0 - n1
        var k:Int = 0
        while(k < n)
        {
            // pos of current offset 12 suffix
            let i:Int = sa12[t] < n0 ? sa12[t] * 3 + 1 : (sa12[t] - n0) * 3 + 2
            // pos of current offset 0 suffix
            let j:Int = sa0[p]
            if sa12[t] < n0 ?
                (s[i] < s[j] || s[i] == s[j] && s12[sa12[t]+n0] <= s12[j/3]) :
                (s[i] < s[j] || s[i] == s[j] && (s[i+1] < s[j+1] || s[i+1] == s[j+1] && s12[sa12[t]-n0+1] <= s12[j/3+n0]))
            {
                // suffix from a12 is smaller
                sa[k] = i
                t += 1
                if t == n02
                {
                    // done --- only sa0 suffixes left
                    k += 1
                    while(p < n0)
                    {
                        sa[k] = sa0[p]
                        p += 1
                        k += 1
                    }
                }
            }
            else
            {
                // suffix from sa0 is smaller
                sa[k] = j
                p += 1
                if p == n0
                {
                    // done --- only sa12 suffixes left
                    k += 1
                    while(t < n02)
                    {
                        sa[k] = sa12[t] < n0 ? sa12[t] * 3 + 1 : (sa12[t] - n0) * 3 + 2
                        t += 1
                        k += 1
                    }
                }
            }
            k += 1
        }
    }
    
    func radixPass(_ a:[Int],_ b:inout [Int],_ r:[Int],_ l:Int,_ n:Int,_ K:Int)
    {
        // counter array
        var c:[Int] = [Int](repeating:0,count:K + 1)
        for i in 0..<n
        {
            // count occurrences
            c[r[l + a[i]]] += 1
        }
        var i:Int = 0
        var sum:Int = 0
        while(i <= K)
        {
            // exclusive prefix sums
            let t:Int = c[i]
            c[i] = sum
            sum += t
            i += 1
        }
        for i in 0..<n
        {
            b[c[r[l + a[i]]]] = a[i]
            c[r[l + a[i]]] += 1
        }
    }
}

//Character扩展
extension Character
{
    //Character转ASCII整数值(定义小写为整数值)
    
    var ascii: Int {
        get {
            return Int(self.unicodeScalars.first?.value ?? 0)
        }
    }
}

extension String {
    // 截取字符串：指定索引和字符数
    // - begin: 开始截取处索引
    // - count: 截取的字符数量
    func subString(_ begin:Int,_ count:Int) -> String {
        let start = self.index(self.startIndex, offsetBy: max(0, begin))
        let end = self.index(self.startIndex, offsetBy:  min(self.count, begin + count))
        return String(self[start..<end])
    }
}




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

