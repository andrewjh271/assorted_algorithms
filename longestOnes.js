/*
Given a binary array nums and an integer k, return the maximum
number of consecutive 1's in the array if you can flip at most k 0's.

Example 1:

Input: nums = [1,1,1,0,0,0,1,1,1,1,0], k = 2
Output: 6
Explanation: [1,1,1,0,0,1,1,1,1,1,1]
Bolded numbers were flipped from 0 to 1. The longest subarray is underlined.
Example 2:

Input: nums = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], k = 3
Output: 10
Explanation: [0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1]
Bolded numbers were flipped from 0 to 1. The longest subarray is underlined.
 

Constraints:

1 <= nums.length <= 105
nums[i] is either 0 or 1.
0 <= k <= nums.length

https://leetcode.com/problems/max-consecutive-ones-iii/

*/

const longestOnes = (array, k) => {
  let flipsRemaining = k;
  let left =-1;
  let max = 0;
  
  for(let right = 0; right < array.length; right++) {
    if(array[right] === 0) {
      if(flipsRemaining > 0) {
        flipsRemaining--;
      } else {
        left = array.indexOf(0, left + 1);
      }
    }
    max = Math.max(right - left, max);
  }
  return max;
}