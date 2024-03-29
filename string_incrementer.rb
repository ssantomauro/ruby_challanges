# String Incrementer
# Write a function which increments a string to create a new string.
#
#   If the string ends with a number, the number should be incremented by 1.
#   If the string doesn't end with a number, 1 should be added to the new string.
# If the number has leading zeros, the amount of digits should be considered.
# Examples
# increment_string("foo") ➞ "foo1"
#
# increment_string("foobar0009") ➞ "foobar0010"
#
# increment_string("foo099") ➞ "foo100"

require_relative("benchmark_helper")
require("test/unit/assertions")

include(Test::Unit::Assertions)

def increment_string(str)
  ends_with_num = str =~ /\d$/
  return "#{str}1" unless ends_with_num

  left_str = str.split(/\d+$/).first
  right_str = str.split(left_str).last

  new_num = (right_str.to_i + 1).to_s
  "#{left_str}#{new_num.rjust(right_str.size, '0')}"
end

BenchmarkHelper.measure do
  assert_equal(increment_string("foo"), "foo1")
  assert_equal(increment_string("foobar01002"), "foobar01003")
  assert_equal(increment_string("foo099"), "foo100")
  assert_equal(increment_string("foo09999"), "foo10000")
end
