# Find Intersection
#
# Have the function FindIntersection(strArr) read the array of strings stored in strArr which will contain 2 elements:
# the first element will represent a list of comma-separated numbers sorted in ascending order, the second element will
# represent a second list of comma-separated numbers (also sorted). Your goal is to return a comma-separated string
# containing the numbers that occur in elements of strArr in sorted order. If there is no intersection, return the string false.
#
# Examples
# Input: ["1, 3, 4, 7, 13", "1, 2, 4, 13, 15"]
# Output: 1,4,13
#
# Input: ["1, 3, 9, 10, 17, 18", "1, 4, 9, 10"]
# Output: 1,9,10

require_relative("benchmark_helper")
require("test/unit/assertions")

include(Test::Unit::Assertions)

def find_intersection(arr)
  intersection = (arr.first.split(',').map(&:to_i) & arr.last.split(',').map(&:to_i))
  return "false" if intersection.size.zero?

  intersection.join(",")
end

BenchmarkHelper.measure do
  assert_equal(find_intersection(["1, 3, 4, 7, 13", "1, 2, 4, 13, 15"]), "1,4,13")
  assert_equal(find_intersection(["1, 3, 9, 10, 17, 18", "1, 4, 9, 10"]), "1,9,10")
  assert_equal(find_intersection(["1, 3", "4, 9, 10"]), "false")
end
