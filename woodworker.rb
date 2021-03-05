require 'byebug'

# You are a woodworker with a wheel of tools. To access a tool you can rotate the wheel to 
# the right or the left. Find the direction with the minimum number of moves and return the 
# number of moves.
# Function should take the following arguments: array of Tools, current position, and the 
# target tool. Function should return the minimum number of moves.
# ex: 
# const tools = ['hammer', 'saw', 'brush', 'screwdriver', 'ruler', 'sandpaper', 'wrench'];
# const current = 'saw';
# const target = 'wrench';
# function returns 2. moves 'left' (backwards) through array to get to target.

def woodworker(tools, current, target)
  current_idx = tools.find_index(current)
  target_idx = tools.find_index(target)
  forwards = (target_idx - current_idx).abs
  backwards = tools.length - forwards
  [backwards, forwards].min
end

puts woodworker(['hammer', 'saw', 'brush', 'screwdriver', 'ruler', 'sandpaper', 'wrench'], 'saw', 'wrench')
puts woodworker(['hammer', 'saw', 'brush', 'screwdriver', 'ruler', 'sandpaper', 'wrench'], 'screwdriver', 'ruler')
puts woodworker(['hammer', 'saw', 'brush', 'screwdriver', 'ruler', 'sandpaper', 'wrench'], 'wrench', 'hammer')
puts woodworker(['hammer', 'saw', 'brush', 'screwdriver', 'ruler', 'sandpaper', 'wrench'], 'brush', 'ruler')
puts woodworker(['hammer', 'saw', 'brush', 'screwdriver', 'ruler', 'sandpaper', 'wrench'], 'ruler', 'saw')