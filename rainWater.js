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
  let rainwater = 0;
  let lftBound = heights[0];
  let currentTrap = [];

  for(let i = 1; i < heights.length; i++) {
    if(!lftBound) { // find first non-zero value
      lftBound = heights[i];
      continue;
    }

    if(heights[i] < lftBound) {
      currentTrap.push(heights[i]);
    } else {
      rainwater += currentTrap.reduce((sum, item) => sum + (lftBound - item), 0);
      lftBound = heights[i];
      currentTrap = [];
    }
  }

  if(currentTrap.length > 0) { // end of heights array reached with no value >= current lftBound
    let rtBound = Math.max(...currentTrap);
    let index;
    for(let i = currentTrap.length - 1; i >= 0; i--) {
      if (currentTrap[i] === rtBound) {
        index = i;
        break;
      }
    }
    rainwater += currentTrap.slice(0, index).reduce((sum, item) => sum + (rtBound - item), 0);
  }
  return rainwater;
}