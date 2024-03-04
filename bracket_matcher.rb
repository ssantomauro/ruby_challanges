# Bracket Matcher
#
# Have the function BracketMatcher(str) take the str parameter being passed and return 1 if the brackets are correctly
# matched and each one is accounted for. Otherwise return 0.
#
# For example: if str is "(hello (world))", then the output
# should be 1, but if str is "((hello (world))" the the output should be 0 because the brackets do not correctly match up.
# Only "(" and ")" will be used as brackets. If str contains no brackets return 1.
#
# Examples
# Input: "(coder)(byte))"
# Output: 0
#
# Input: "(c(oder)) b(yte)"
# Output: 1

require_relative("benchmark_helper")
require("test/unit/assertions")

include(Test::Unit::Assertions)

def bracket_matcher(str)
  # Initialize a counter to keep track of open brackets
  count = 0

  # Iterate through each character in the string
  str.each_char do |char|
    # If the character is an open bracket, increment the counter
    if char == '('
      count += 1
      # If the character is a close bracket, decrement the counter
    elsif char == ')'
      count -= 1
    end

    # If at any point the counter goes negative, it means there's a mismatch
    return 0 if count < 0
  end

  # If the counter is zero at the end, all brackets are matched
  count == 0 ? 1 : 0
end

BenchmarkHelper.measure do
  assert_equal(bracket_matcher("(coder)(byte))("), 0)
  assert_equal(bracket_matcher("(c(oder)) b(yte)"), 1)
  assert_equal(bracket_matcher("the color re(d))()(()"), 0)
end
