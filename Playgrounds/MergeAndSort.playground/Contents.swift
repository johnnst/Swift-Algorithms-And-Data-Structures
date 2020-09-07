// Author: John Ngoi
// Book: Interviewing in Swift:
// Algorithms and Data Structures:
// Your guide in helping you prepare for the real world of software engineering interviews as an iOS or Mac OS developer.
// Available on Amazon and Kindle! Search for "john ngoi" to find the book!
// ASIN: B01L8DY5H6
//
// Merge and Sort
//
// Swift 5.3
// Given two sorted arrays, merge nums1 and nums2 into nums1.
// Assume nums1 size is equal m + n.
//
// Input:
// nums1 = [1,2,3,0,0,0], m = 3
// nums2 = [2,5,7],       n = 3
//
// Output: [1,2,2,3,5,7]
//
// Approach
// To get a good time and space complexity, we can use pointers.
// p1 and p2 will point to the last index for nums1 and nums2 respectively.
// p will be the decrementing pointer for the size of nums1.
// The time complexity is O(m + n)
// The space complexity is O(1)

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    
    var p1 = m - 1
    var p2 = n - 1
    var p = m + n - 1
    
    while p1 >= 0 && p2 >= 0 {
        if nums1[p1] < nums2[p2] {
            nums1[p] = nums2[p2]
            p2 -= 1
        } else {
            nums1[p] = nums1[p1]
            p1 -= 1
        }
        p -= 1
    }
    
    nums1[..<(p2 + 1)] = nums2[..<(p2 + 1)] // merge remainder from nums2
}

// test it!

var nums1 = [1, 2, 3, 0, 0, 0]
var nums2 = [2, 5, 7]

merge(&nums1, 3, nums2, 3)
print(nums1)

var nums3 = [4, 5, 0, 0, 0]
var nums4 = [1, 2, 3]

merge(&nums3, 2, nums4, 3)
print(nums3)

var nums5 = [4, 5, 9, 0, 0, 0, 0]
var nums6 = [10, 12, 15, 17]

merge(&nums5, 3, nums6, 4)
print(nums5)
