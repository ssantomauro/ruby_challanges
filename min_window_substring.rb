# Min Window Substring
# Have the function MinWindowSubstring(strArr) take the array of strings stored in strArr, which will contain only two strings,
# the first parameter being the string N and the second parameter being a string K of some characters,
# and your goal is to determine the smallest substring of N that contains all the characters in K.
#
# For example: if strArr is ["aaabaaddae", "aed"] then the smallest substring of N that contains the characters a, e, and d is "dae" located
# at the end of the string. So for this example your program should return the string dae.
# Another example: if strArr is ["aabdccdbcacd", "aad"] then the smallest substring of N that contains all of the characters in K is "aabd" which is located at
# the beginning of the string.
#
# Both parameters will be strings ranging in length from 1 to 50 characters and all of K's characters will exist somewhere in the string N.
# Both strings will only contains lowercase alphabetic characters.
#
# Examples
# Input: ["ahffaksfajeeubsne", "jefaa"]
# Output: aksfaje
#
# Input: ["aaffhkksemckelloe", "fhea"]
# Output: affhkkse

require_relative("benchmark_helper")
require("test/unit/assertions")

include(Test::Unit::Assertions)

def min_window_substring(arr)
  all_matches = []

  right_str = arr.last.chars
  str_arr = arr.first.chars

  (0..str_arr.size-right_str.size).each do |i|
    end_idx = i + right_str.size - 1

    while end_idx < str_arr.size
      min_str = str_arr[i..end_idx]
      all_matches << min_str.join if right_str.all? { |c| min_str.count(c) >= right_str.count(c) }

      end_idx += 1
    end
  end

  all_matches.sort_by { |el| el.size }.first
end

BenchmarkHelper.measure do
  assert_equal(min_window_substring(["ahffaksfajeeubsne", "jefaa"]), "aksfaje")
  assert_equal(min_window_substring(["aaffhkksemckelloe", "fhea"]), "affhkkse")
end
