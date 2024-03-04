# Codeland Username Validation
#
# Have the function CodelandUsernameValidation(str) take the str parameter being passed and determine if the string is a valid username according to the following rules:
#
# 1. The username is between 4 and 25 characters.
# 2. It must start with a letter.
# 3. It can only contain letters, numbers, and the underscore character.
# 4. It cannot end with an underscore character.
#
# If the username is valid then your program should return the string true, otherwise return the string false.
#
# Examples
#
# Input: "aa_"
# Output: false
#
# Input: "u__hello_world123"
# Output: true

require_relative("benchmark_helper")
require("test/unit/assertions")

include(Test::Unit::Assertions)

def codeland_username_validation(str)
  return false unless (4..25).cover?(str.size)
  return false unless str[0].match?(/[A-Za-z]/)
  return false if str.match(/^\w*$/).nil?
  return false if str[-1, 1] == '_'

  true
end

BenchmarkHelper.measure do
  assert_equal(codeland_username_validation("aaaa_"), false)
  assert_equal(codeland_username_validation("u__hello_world123"), true)
  assert_equal(codeland_username_validation("1__hello_world123"), false)
  assert_equal(codeland_username_validation("he.llo_world123z"), false)
  assert_equal(codeland_username_validation("he.llo_wasdsadsa6dsadsa.,dsadsadsahdksh7q36473qeqwkjdhaskudhkjqie76q347362dhkahdkajshd7q3d.,,.ds,g.dfgd.ht,.r,efduhwaorld123z"), false)
end
