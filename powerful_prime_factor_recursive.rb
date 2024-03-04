# Powerful Prime Factor
# Create a function that takes a positive integer and returns a string expressing how the number can be made by multiplying powers of its prime factors.
#
#   Examples
# express_factors(2) ➞ "2"
#
# express_factors(4) ➞ "2^2"
#
# express_factors(10) ➞ "2 x 5"
#
# express_factors(60) ➞ "2^2 x 3 x 5"
#
# Notes
# All inassert_equal(will be positive integers in the range 1 < n < 10,000.
#   If a factor is repeated express it in the form "x^y" where x is the factor and y is the number of repetitions of the factor.
#   If n is a prime number, return n as a string as in example #1 above.
# Factors should appear in ascending order in the expression.
#   Make sure you include the space either side of the multiplication sign, " x ".
#     Check the Resources if you need to understand Prime Factorization.

require_relative("benchmark_helper")
require("test/unit/assertions")

include(Test::Unit::Assertions)

def prime?(n)
  (1..n).map { |i| (n % i == 0) ? 1 : 0 }.inject(0, :+) == 2
end

def process!(n, h)
  if prime?(n)
    h[n] = 0 unless h.key?(n)
    h[n] += 1
  else
    i = 1
    begin
      i += 1
      if n % i == 0
        h[i] = 0 unless h.key?(i)
        h[i] += 1

        process!(n / i, h)
      end
    end while n % i > 0
  end
end

def express_factors(n)
  h = {}
  process!(n, h)

  h.map { |k, v| (v > 1) ? "#{k}^#{v}" : k }.join(" x ")
end

BenchmarkHelper.measure do
  assert_equal(express_factors(2), "2")
  assert_equal(express_factors(4), "2^2")
  assert_equal(express_factors(10), "2 x 5")
  assert_equal(express_factors(11), "11")
  assert_equal(express_factors(29), "29")
  assert_equal(express_factors(60), "2^2 x 3 x 5")
  assert_equal(express_factors(100), "2^2 x 5^2")
  assert_equal(express_factors(151), "151")
  assert_equal(express_factors(323), "17 x 19")
  assert_equal(express_factors(997), "997")
  assert_equal(express_factors(3349), "17 x 197")
  assert_equal(express_factors(5040), "2^4 x 3^2 x 5 x 7")
  assert_equal(express_factors(6097), "7 x 13 x 67")
  assert_equal(express_factors(8192), "2^13")
  assert_equal(express_factors(9870), "2 x 3 x 5 x 7 x 47")
  assert_equal(express_factors(9973), "9973")
  assert_equal(express_factors(9999), "3^2 x 11 x 101")
end
