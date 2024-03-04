# First Reverse
# Have the function FirstReverse(str) take the str parameter being passed and return the string in reversed order.
# For example: if the input string is "Hello World and Coders" then your program should return the string sredoC dna dlroW olleH.
#
#   Examples
# Input: "coderbyte"
# Output: etybredoc
#
# Input: "I Love Code"
# Output: edoC evoL I
#

require_relative("benchmark_helper")
require("test/unit/assertions")

include(Test::Unit::Assertions)

def first_reverse(str)
  str.reverse
end

BenchmarkHelper.measure do
  assert_equal(first_reverse("coderbyte"), "etybredoc")
  assert_equal(first_reverse("I Love Code"), "edoC evoL I")
end
