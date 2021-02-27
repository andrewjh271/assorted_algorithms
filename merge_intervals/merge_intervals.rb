# @param {Integer[][]} intervals
# @return {Integer[][]}
def merge(intervals)
  sorted_intervals = intervals.sort
  merged = [sorted_intervals.shift]
  sorted_intervals.each do |interval|
      if interval[0] <= merged.last[1]
          merged.last[1] = [interval[1], merged.last[1]].max
      else
          merged << interval
      end
  end
  merged
end


p merge([['a', 'c'], ['b', 'f'], ['h', 'j'], ['l', 'r']])
p merge([[1,3],[2,6],[8,10],[15,18]])