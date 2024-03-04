# What Type of Triangle?
#
# Create a function which returns the type of triangle, given the side lengths. Return the following values if they match the criteria.
#
#   No sides equal: "scalene"
# Two sides equal: "isosceles"
# All sides equal: "equilateral"
# Less or more than 3 sides given: "not a triangle"
# Examples
# get_triangle_type([2, 6, 5]) ➞ "scalene"
#
# get_triangle_type([4, 4, 7]) ➞ "isosceles"
#
# get_triangle_type([8, 8, 8]) ➞ "equilateral"
#
# get_triangle_type([3, 5, 5, 2]) ➞ "not a triangle"
# Notes
# You will be given an array of positive integers.
#   Check the Resources tab for more information on the types of triangles.

require_relative("benchmark_helper")
require("test/unit/assertions")

include(Test::Unit::Assertions)

def get_triangle_type(arr)
  return "not a triangle" unless arr.size == 3

  case arr.uniq.size
  when 3
    "scalene"
  when 2
    "isosceles"
  else
    "equilateral"
  end
end

BenchmarkHelper.measure do
  assert_equal(get_triangle_type([2, 6, 5]), "scalene")
  assert_equal(get_triangle_type([4, 4, 7]), "isosceles")
  assert_equal(get_triangle_type([8, 8, 8]), "equilateral")
  assert_equal(get_triangle_type([3, 5, 5, 2]), "not a triangle")
end
