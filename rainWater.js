/*
Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.
Example 1:

Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]
Output: 6
Explanation: The above elevation map (black section) is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped.
Example 2:

Input: height = [4,2,0,3,2,5]
Output: 9

Constraints:

n == height.length
1 <= n <= 2 * 104
0 <= height[i] <= 105

https://leetcode.com/problems/trapping-rain-water/
*/

const trap = (heights) => {
  let rain = 0;
  let limitLft = heights[0];
  let j = heights.length - 1;
  let limitRt = heights[j];

  for(let i = 1; i < j; i++) {
    if(!limitLft) {
      limitLft = heights[i];
      continue;
    }

    while(limitRt < limitLft) {
      j--;
      if(heights[j] < limitRt) {
        rain += (limitRt - heights[j]);
      } else if(heights[j] > limitRt) {
        limitRt = heights[j];
      }   
      if(j < (i + 1)) return rain;
    }

    if (heights[i] < limitLft) {
      rain += (limitLft - heights[i]);
    } else if(heights[i] > limitLft) {
      limitLft = heights[i];
    }

  }
  return rain;
}