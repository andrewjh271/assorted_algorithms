/*
Given a binary array, find the maximum number of zeros in an array with one flip
 of a subarray allowed. A flip operation switches all 0s to 1s and 1s to 0s.
Examples:

Input :  arr[] = {0, 1, 0, 0, 1, 1, 0}
Output : 6
We can get 6 zeros by flipping the subarray {4, 5}

Input :  arr[] = {0, 0, 0, 1, 0, 1}
Output : 5

https://www.geeksforgeeks.org/maximize-number-0s-flipping-subarray/
*/

const bitFlip = (array) => {
  let left = 0;
  let netGain = 0;
  let maxGain = 0;
  let zeros = 0;

  for(let right = 0; right < array.length; right++) {
    if(array[right] === 0) {
      zeros++;
      if(left < right) { //currently exploring a subarray
        netGain--;
        if(netGain === 0)
          left = right + 1; //no longer interested in subarray, so reset
      } else {
        left++; //keeping up with right pointer — not currently exploring a subarray
      }
    } else {
      netGain++;
      maxGain = Math.max(maxGain, netGain);
    }
  }
  return zeros + maxGain;
}


bitFlip([1, 1, 0, 1, 1, 0]);
bitFlip([0, 1, 0, 0, 1, 1, 0]);