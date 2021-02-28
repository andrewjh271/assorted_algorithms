require 'byebug'
require_relative 'benchmarks'

class Balanced
  extend Benchmarks

  def self.balanced_fragment_length(string)
    substring = ''
    0.upto(string.length - 2) do |i|
      unmatched = [string[i]]
      matched = []
      
      (i + 1).upto(string.length - 1) do |j|
        char = string[j]
        char_reversed = char.swapcase
        if matched.include?(char)
          string[i] == char ? break : next
        elsif unmatched.delete(char_reversed) # if clause is true if char_reversed is successfully found and deleted
          if unmatched.empty?
            current = string[i..j]
            substring = current if substring.empty? || current.length < substring.length
            return substring if substring.length == 2 # minimum possible substring found — return it
            break
          end
          matched += [char, char_reversed]
        elsif unmatched.length > j - i
          break
        else
          unmatched << char unless unmatched.include?(char)
        end
      end
    end
    substring.empty? ? -1 : substring
  end

  # same algorithm, but using hashes for matched and unmatched
  def self.balanced_fragment_length2(string)
    substring = ''
    0.upto(string.length - 2) do |i|
      unmatched = { string[i] => true }
      matched = {}
      
      (i + 1).upto(string.length - 1) do |j|
        char = string[j]
        char_reversed = char.swapcase
        if matched[char]
          string[i] == char ? break : next
        elsif unmatched.delete(char_reversed) # if clause is true if char_reversed is successfully found and deleted
          if unmatched.empty?
            current = string[i..j]
            substring = current if substring.empty? || current.length < substring.length
            return substring if substring.length == 2 # minimum possible substring found — return it
            break
          end
          matched[char] = true
          matched[char_reversed] = true
        elsif unmatched.length > j - i
          break
        else
          unmatched[char] = true
        end
      end
    end
    substring.empty? ? -1 : substring
  end

  # algorithm that keeps track of the most recent interval index of lower/upper pairs, merges them, and finds minimum
  def self.balanced_fragment_length3(string)
    index_hash = Hash.new(-Float::INFINITY) # default value of a key not present will be negative infinity
    min = Float::INFINITY
    min_interval = nil
    string.each_char.with_index do |char, i|
      index_hash[char] = i
      alphabet = index_hash.keys.map(&:downcase).uniq # array of unique lowercase versions of all present characters
      intervals = []
      alphabet.each do |lower|
        lower_idx = index_hash[lower]
        upper_idx = index_hash[lower.upcase]
        interval = lower_idx < upper_idx ? [lower_idx, upper_idx] : [upper_idx, lower_idx]
        intervals << interval
      end
      merged = merge(intervals)
      merged.each do |interval|
        interval_length = interval[1] - interval[0]
        if interval_length < min
          min = interval_length
          min_interval = interval
          return string[min_interval[0]..min_interval[1]] if min == 2 # minimum possible substring found — return it
        end
      end
    end
    min_interval ? string[min_interval[0]..min_interval[1]] : -1
  end

  def self.merge(intervals)
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

  # attempt at sliding window approach — doesn't work
  # azABaabza
  # left = 0; right = 6
  # counter = {"a"=>[3, 1], "z"=>[1, 0], "b"=>[1, 1]}
  # no way of knowing that left pointer should start incrementing, since substring is not balanced here
  def self.balanced_fragment_length4(string)
    counter = {}
    min = Float::INFINITY
    min_interval = nil
    left = 0
    string.each_char.with_index do |char, right|
      key = char.downcase
      counter[key] ||= [0, 0]
      key == char ? counter[key][0] += 1 : counter[key][1] += 1
      while(counter.values.flatten(1).none?(0))
        interval_length = right - left
        if interval_length < min
          min = interval_length
          min_interval = [left, right]
        end
        old_char = string[left]
        old_key = old_char.downcase
        old_key == old_char ? counter[old_key][0] -= 1 : counter[old_key][1] -= 1
        counter.delete(old_key) if counter[old_key] == [0, 0]
        left += 1
      end
    end
  end
end

Balanced.benchmark