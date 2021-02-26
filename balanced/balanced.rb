# A string is called balanced when every letter occurring in the string appears both in upper- and lowercase. 
# For example, the string 'CATattac' is balanced (a, c, and t occur in both cases), but 'Madam' is not 
# (d and a appear only in lower case). Note that the number of occurrences does not matter.
# Write a function that, given a string S of length N, returns the length of the shortest 
# balanced fragment of S. If S does not contain any balanced fragments, the function should return -1.
  
# Examples:
# balancedFragmentLength('azABaabza') // shortest balanced fragment is 'ABaab', returns 5
# balancedFragmentLength('TacoCat') // there is no balanced fragment, returns -1
# balancedFragmentLength('AcZCbaBz') // shortest balanced fragment is whole string, returns 8
# balancedFragmentLength('abcdefghijklmnopqrstuvwxyz') // no balanced fragment, returns -1

require 'byebug'
require_relative 'benchmarks'

class Balanced
  extend Benchmarks
  
  def self.balancedFragmentLength(string)
    new(string).balancedFragmentLength
  end

  attr_reader :string

  def initialize(string)
    @string = string
  end

  def balancedFragmentLength
    fragment = ''
    0.upto(string.length - 1) do |i|
      unmatched = []
      matched = []
      unmatched << string[i]
      
      (i + 1).upto(string.length - 1) do |j|
        char = string[j]
        char_reversed = reverse_case(char)
        if matched.include?(char)
          string[i] == char ? break : next
        elsif unmatched.delete(char_reversed)
          if unmatched.empty?
            current = string[i..j]
            fragment = current if fragment.empty? || current.length < fragment.length
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
    fragment.empty? ? -1 : fragment
  end

  private

  def reverse_case(char)
    char.match?(/[a-z]/) ? char.upcase : char.downcase
  end
end

# puts Balanced.balancedFragmentLength('azAabBZ')
# puts Balanced.balancedFragmentLength('azABaabza') # ABaab
# puts Balanced.balancedFragmentLength('TacoCat') # there is no balanced fragment, returns -1
# puts Balanced.balancedFragmentLength('AcZCbaBz') # shortest balanced fragment is whole string, returns 8
# puts Balanced.balancedFragmentLength('abcdefghijklmnopqrstuvwxyz') # no balanced fragment, returns -1
# puts Balanced.balancedFragmentLength('abcdefgHIJABCDEFGahij') # bcdefgHIJABCDEFGahij


Balanced.benchmark