/* You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed,
 the only constraint stopping you from robbing each of them is that adjacent houses have security systems connected and 
 it will automatically contact the police if two adjacent houses were broken into on the same night.

Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob 
tonight without alerting the police.

https://leetcode.com/problems/house-robber/
*/

const rob = (houses) => {
  houses.forEach((e, i, arr) => {
    arr[i] = Math.max((e + (arr[i-2] || 0)), (e + (arr[i-3] || 0)));
  })
  return Math.max(...houses.slice(-2))
}
