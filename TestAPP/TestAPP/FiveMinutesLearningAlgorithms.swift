//
//  FiveMinutesLearningAlgorithms.swift
//  TestAPP
//
//  Created by louchu on 2018/12/5.
//  Copyright © 2018年 Cy Lou. All rights reserved.
//
/*
 五分钟学算法记录
 公众号：五分钟学算法
 
 */
import Foundation

//MARK: leetcode上第283号问题：Move Zeros
/*
 remove zeros to the end of an array
 给定一个数组nums，写一个函数，将数组中所有的0挪到数组的末尾，⽽维持其他所有非0元素的相对位置。
 举例: nums = [0, 1, 0, 3, 12]，函数运⾏后结果为[1, 3, 12, 0, 0]
 */

// 1 more space

func moveZeros(array: inout [Int]) -> [Int] {
    print("before",array);
    var resultArray = Array <Int>()
    var zeroCount = 0
    
    for index in 0..<array.count {
        
        let item = array[index]
        if(item == 0)
        {
            zeroCount += 1
        }else
        {
            resultArray.append(item)
        }
    }
    for i in 0..<zeroCount
    {
        resultArray.append(0)
    }
    print("after",resultArray);
    
    return resultArray
}
//use while ,no more space
func moveZeros2(array: inout [Int]) -> [Int] {
    print("before",array);
    var idx = 0
    var count = 0
    while idx < array.count && count < array.count {
        count += 1
        let item = array[idx]
        if(item == 0)
        {
            array.remove(at: idx)
            array.append(0)
            
        }else
        {
            idx += 1
        }
    }
    
    print("after",array);
    return array
}

//MARK: leetcode上第75号问题：Sort Colors

/*
 给定一个包含红色、白色和蓝色，一共 n 个元素的数组，原地对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。
 此题中，我们使用整数 0、 1 和 2 分别表示红色、白色和蓝色。
 注意:
 不能使用代码库中的排序函数来解决这道题。
 示例:
 输入: [2,0,2,1,1,0]
 输出: [0,0,1,1,2,2]

 */
//one direction , 4 more spaces [waste too much]
//FIXME: 对输入的数组进行校验
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
// double direction to sort ,no more space
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




//MARK: leetcode上167号问题：Two Sum II

/*
 给定一个已按照升序排列 的有序数组，找到两个数使得它们相加之和等于目标数。
 函数应该返回这两个下标值 index1 和 index2，其中 index1 必须小于 index2。
 说明:
 返回的下标值（index1 和 index2）不是从零开始的。
 你可以假设每个输入只对应唯一的答案，而且你不可以重复使用相同的元素。
 示例:
 输入: numbers = [2, 7, 11, 15], target = 9
 输出: [1,2]
 解释: 2 与 7 之和等于目标数 9 。因此 index1 = 1, index2 = 2 。

 */

func twosum(array: inout [Int],target: Int) -> [Int]?
{
    print("array:",array,"target:",target)
    var left = 0
    var right = array.count-1
    var find = false
    while left<right {
        let result = array[left]+array[right]
        if(result==target)
        {
            find = true
            break;
        }else if(result>target)
        {
            right -= 1
        }else
        {
            left += 1
        }
    }
    
    if find {
        print("find:",[left,right])
        return [left,right]
    }else
    {
        print("can not find")
        return nil
    }
    
    
}

//MARK: leetcode上第209号问题：Minimum Size Subarray Sum
/*给定一个含有 n 个正整数的数组和一个正整数 s ，找出该数组中满足其和 ≥ s 的长度最小的连续子数组。如果不存在符合条件的连续子数组，返回 0。
 示例:
 输入: s = 7, nums = [2,3,1,2,4,3]
 输出: 2
 解释: 子数组 [4,3] 是该条件下的长度最小的连续子数组。
*/
func sizeofsunarraysum( array:[Int],target: Int)-> Int
{
    print("data:",array)
    var left = 0
    var right = 0
    var sum = 0
    var find = false
    var resultArray = [0,array.count-1]
    
    while right < array.count && left < array.count{
        print("left:",left,"right:",right)
        sum += array[right]
        if(sum >= target)
        {
            find = true
            if( right-left < resultArray[1] - resultArray[0] )
            {
                resultArray = [left,right]
                print("result:",resultArray[0],resultArray[1])
            }
            
            while left < right
            {
                print("left:",left,"right:",right)
                
                sum -= array[left]
                left += 1
                if(sum<target)
                {
                    print("break")
                    break
                }else
                {
                    if( right-left < resultArray[1] - resultArray[0] )
                    {
                        resultArray = [left,right]
                        print("result:",resultArray[0],resultArray[1])
                    }
                }
                
            }
            
        }
        right += 1
        
    }
    if find == true {
        print("result:",resultArray[0],resultArray[1],"length:",resultArray[1] - resultArray[0] + 1)
        return resultArray[1] - resultArray[0] + 1
    }
    print("cant find")
    return 0
}

//MARK: leetcode上第349号问题：Intersection of Two Arrays
/*
 给定两个数组，编写一个函数来计算它们的交集。
 示例 1:
 输入: nums1 = [1,2,2,1], nums2 = [2,2]
 输出: [2]
 示例 2:
 输入: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
 输出: [9,4]
 说明:
 输出结果中的每个元素一定是唯一的。
 我们可以不考虑输出结果的顺序。
 */
func intersectionOfTwoArrays(array1:[Int],array2:[Int]) -> [Int]! {
    let set1 = Set(array1)
    let set2 = Set(array2)
    
    print("data array1:",array1,"array2:",array2,"after set1:",set1,"set2:",set2)
    
    var result = Array <Int>()
    for item in set1 {
        for item2 in set2 {
            if (item==item2)
            {
                result.append(item)
                break
            }
        }
    }
    print("result:",result)
    return result
}


//MARK: leetcode上第350号问题：Intersection of Two Arrays II
/* 给定两个数组，编写一个函数来计算它们的交集。
 示例 1:
 输入: nums1 = [1,2,2,1], nums2 = [2,2]
 输出: [2,2]
 示例 2:
 输入: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
 输出: [4,9]
 说明：
 输出结果中每个元素出现的次数，应与元素在两个数组中出现的次数一致。
 我们可以不考虑输出结果的顺序。*/
//我的做法 遍历两个数组，每次遍历到遇到相同的元素时，append到resultSet中，当遍历不到相同的元素时，再尝试从resultSet中剔除【即排除出现次数不一致的元素】
func intersectionOfTwoArrays2(array1:inout [Int],array2:inout[Int]) -> [Int]! {
    
    print("data array1:",array1,"array2:",array2)
    var result = Set <Int>()
//    改为while
    var index1=0
    var index2=0
    while index1<array1.count {
        var find = false
        while index2<array2.count {
            if (array1[index1]==array2[index2])
            {
                find = true
                result.insert(array1[index1])
                //                遍历到遇到相同的元素时，append到resultSet,并在两个数组中删除此次遍历到的元素
                array2.remove(at: index2)
                
                break
            }else
            {
                index2 += 1
            }
        }
        if(find==false)
        {
            //            遍历不到相同的元素时，再尝试从resultSet中剔除
            result.remove(array1[index1])
            array1.remove(at: index1)
            
        }else
        {
            array1.remove(at: index1)
        }
        
    }

    print("result:",result)
    return Array(result)
}


//MARK: leetcode上第1号问题：Two Sum
/*
 给定一个整数数组和一个目标值，找出数组中和为目标值的两个数。
 你可以假设每个输入只对应一种答案，且同样的元素不能被重复利用。
 示例:
 给定 nums = [2, 7, 11, 15], target = 9
 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]
 */

func twosumofarray(array:[Int],target:Int) -> [Int]! {
    print("data:",array)
    for left in 0..<array.count {
        for right in 0..<array.count
        {
            if(left != right)
            {
                if(array[left] + array[right] == target)
                {
                    print("result:",[left,right])
                    return[left,right]
                }
            }
        }
    }
    print("no result")
    return[]
}


//MARK: leetcode上第447号问题：Number of Boomerangs
/*
 原文描述：
 Given n points in the plane that are all pairwise distinct, a "boomerang" is a tuple of points (i, j, k) such that the distance between iand j equals the distance between i and k (the order of the tuple matters).
 
 Find the number of boomerangs. You may assume that n will be at most 500 and coordinates of points are all in the range [-10000, 10000](inclusive).
 
 
 给定平面上 n 对不同的点，“回旋镖” 是由点表示的元组 (i, j, k) ，其中 i 和 j 之间的距离和 i 和 k 之间的距离相等（需要考虑元组的顺序）。
 找到所有回旋镖的数量。你可以假设 n 最大为 500，所有点的坐标在闭区间 [-10000, 10000] 中。
 示例:
 输入:
 [[0,0],[1,0],[2,0]]
 输出:
 2
 解释:
 两个回旋镖为 [[1,0],[0,0],[2,0]] 和 [[1,0],[2,0],[0,0]] */

//计算平方和
//嵌套3层循环


func numberOfBoomerangs(points:inout[[Int]]) -> [[Int]]? {
    
    for aim in 0..<points.count {
        for first in 0..<points.count
        {
            for second in 0..<points.count
            {
                
               
            }
        }
    }
    return [[]]
}


//MARK: leetcode上第219号问题：Contains Duplicate II
/* 给出⼀个整形数组nums和⼀个整数k，是否存在索引i和j，使得nums[i] == nums[j] 且i和j之间的差不超过k
 Example 1:
 Input: nums = [1,2,3,1], k = 3
 Output: true.
 Example 2:
 Input: nums = [1,0,1,1], k = 1
 Output: true
 Example 3:
 Input: nums = [1,2,3,1,2,3], k = 2
 Output: false*/

//MARK: LeetCode上第344号问题：Reverse String
/*编写一个函数，其作用是将输入的字符串反转过来。
 示例 1:
 
 输入: "hello"
 输出: "olleh"
 示例 2:
 
 输入: "A man, a plan, a canal: Panama"
 输出: "amanaP :lanac a ,nalp a ,nam A" */

//MARK: LeetCode上第203号问题：Remove Linked List Elements
/*删除链表中等于给定值 val 的所有节点。
 示例:
 
 输入: 1->2->6->3->4->5->6, val = 6
 输出: 1->2->3->4->5 */

//MARK:LeetCode上第24号问题：Swap Nodes in Pairs
/* 给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。
 示例:
 
 给定 1->2->3->4, 你应该返回 2->1->4->3.
 说明:
 
 你的算法只能使用常数的额外空间。
 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。*/

//MARK: LeetCode上第86号问题：Partition List
/*给定一个链表和一个特定值 x，对链表进行分隔，使得所有小于 x 的节点都在大于或等于 x 的节点之前。
 你应当保留两个分区中每个节点的初始相对位置。
 示例:
 
 输入: head = 1->4->3->2->5->2, x = 3
 输出: 1->2->2->4->3->5 */

//MARK: LeetCode上第328号问题：Odd Even Linked List
/* 给定一个单链表，把所有的奇数节点和偶数节点分别排在一起。请注意，这里的奇数节点和偶数节点指的是节点编号的奇偶性，而不是节点的值的奇偶性。
 请尝试使用原地算法完成。你的算法的空间复杂度应为 O(1)，时间复杂度应为 O(nodes)，nodes 为节点总数。
 示例 1:
 输入: 1->2->3->4->5->NULL
 输出: 1->3->5->2->4->NULL
 示例 2:
 输入: 2->1->3->5->6->4->7->NULL
 输出: 2->3->6->7->1->5->4->NULL
 说明:
 应当保持奇数节点和偶数节点的相对顺序。
 链表的第一个节点视为奇数节点，第二个节点视为偶数节点，以此类推。*/

//MARK: LeetCode上第237号问题：Delete Node in a Linked List
/*请编写一个函数，使其可以删除某个链表中给定的（非末尾）节点，你将只被给定要求被删除的节点。
 现有一个链表 -- head = [4,5,1,9]，它可以表示为:
 4 -> 5 -> 1 -> 9
 示例 1:
 
 输入: head = [4,5,1,9], node = 5
 输出: [4,1,9]
 解释: 给定你链表中值为 5 的第二个节点，那么在调用了你的函数之后，该链表应变为 4 -> 1 ->  9.
 示例 2:
 
 输入: head = [4,5,1,9], node = 1
 输出: [4,5,9]
 解释: 给定你链表中值为 1 的第三个节点，那么在调用了你的函数之后，该链表应变为 4 -> 5 -> 9.
 说明:
 
 链表至少包含两个节点。
 链表中所有节点的值都是唯一的。
 给定的节点为非末尾节点并且一定是链表中的一个有效节点。
 不要从你的函数中返回任何结果。  */

//MARK: LeetCode上第206号问题：Reverse Linked List
/* 反转一个单链表。
 示例:
 
 输入: 1->2->3->4->5->NULL
 输出: 5->4->3->2->1->NULL
 进阶:
 
 你可以迭代或递归地反转链表。你能否用两种方法解决这道题？*/

//MARK: LeetCode上第92号问题：反转链表II
/* 反转从位置 m 到 n 的链表。请使用一趟扫描完成反转。
 说明:
 
 1 ≤ m ≤ n ≤ 链表长度。
 示例:
 
 输入: 1->2->3->4->5->NULL, m = 2, n = 4.
 输出: 1->4->3->2->5->NULL */

//MARK: LeetCode上第19号问题：删除链表的倒数第N个节点
/* 给定一个链表，删除链表的倒数第 n 个节点，并且返回链表的头结点。
 示例：
 
 给定一个链表: 1->2->3->4->5, 和 n = 2.
 当删除了倒数第二个节点后，链表变为 1->2->3->5
 说明：
 
 给定的 n 保证是有效的。
 进阶：
 
 你能尝试使用一趟扫描实现吗？ */

//MARK: LeetCode上第20 号问题：有效的括号
/*给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。
 有效字符串需满足：
 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 注意空字符串可被认为是有效字符串。
 示例 1:
 
 输入: "()"
 输出: true
 示例 2:
 
 输入: "()[]{}"
 输出: true
 示例 3:
 
 输入: "(]"
 输出: false
 示例 4:
 
 输入: "([)]"
 输出: false
 示例 5:
 
 输入: "{[]}"
 输出: true */

//MARK: LeetCode上第150号问题：逆波兰表达式求值
/* 根据逆波兰表示法，求表达式的值。
 
 有效的运算符包括 +, -, *, / 。每个运算对象可以是整数，也可以是另一个逆波兰表达式。
 
 说明：
 
 整数除法只保留整数部分。
 给定逆波兰表达式总是有效的。换句话说，表达式总会得出有效数值且不存在除数为 0 的情况。
 
 示例 1：
 
 输入: ["2", "1", "+", "3", "*"]
 输出: 9
 解释: ((2 + 1) * 3) = 9
 
 示例 2：
 输入: [“4”, “13”, “5”, “/“, “+”]
 输出: 6
 解释: (4 + (13 / 5)) = 6
 
 示例 3：
 
 输入: ["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]
 输出: 22
 解释:
 ((10 * (6 / ((9 + 3) * -11))) + 17) + 5
 = ((10 * (6 / (12 * -11))) + 17) + 5
 = ((10 * (6 / -132)) + 17) + 5
 = ((10 * 0) + 17) + 5
 = (0 + 17) + 5
 = 17 + 5
 = 22 */

//MARK: LeetCode上第144 号问题：二叉树的前序遍历
/*给定一个二叉树，返回它的 前序 遍历。
 
 示例:
 
 输入: [1,null,2,3]
 
 输出: [1,2,3]
 
 进阶: 递归算法很简单，你可以通过迭代算法完成吗？ */

//MARK: LeetCode上第94 号问题：二叉树的中序遍历
/* 给定一个二叉树，返回它的 中序 遍历。
 
 示例:
 
 输入: [1,null,2,3]
 
 输出: [1,3,2]
 
 进阶: 递归算法很简单，你可以通过迭代算法完成吗？ */

//MARK: LeetCode上第145 号问题：二叉树的后序遍历
/* 给定一个二叉树，返回它的 后序 遍历。
 
 示例:
 
 输入: [1,null,2,3]
 
 输出: [3,2,1]
 
 进阶: 递归算法很简单，你可以通过迭代算法完成吗？ */

//MARK: LeetCode上第102 号问题：二叉树的层次遍历
/* 给定一个二叉树，返回其按层次遍历的节点值。 （即逐层地，从左到右访问所有节点）。
 
 例如:
 给定二叉树: [3,9,20,null,null,15,7],
 
 返回其层次遍历结果：
 
 [
 [3],
 [9,20],
 [15,7]
 ]
 
 */

//MARK:
/* */

//MARK:
/* */
