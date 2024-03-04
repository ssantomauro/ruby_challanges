# Factorize a Number
# Create a function that takes a number as its argument and returns an array of all its factors.
#
#   Examples
# factorize(12) ➞ [1, 2, 3, 4, 6, 12]
#
# factorize(4) ➞ [1, 2, 4]
#
# factorize(17) ➞ [1, 17]
#
# Notes
# The input integer will be positive.
#   A factor is a number that evenly divides into another number without leaving a remainder. The second example is a factor of 12, because 12 / 2 = 6, with remainder 0.

require_relative("benchmark_helper")
require("test/unit/assertions")

include(Test::Unit::Assertions)

def factorize(num)
  (1..num).map { |i| (num % i == 0) ? i : nil }.compact
end

BenchmarkHelper.measure do
  assert_equal(factorize(12), [1, 2, 3, 4, 6, 12])
  assert_equal(factorize(4), [1, 2, 4])
  assert_equal(factorize(17), [1, 17])
end
