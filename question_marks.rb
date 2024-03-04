# Questions Marks
#
# Have the function QuestionsMarks(str) take the str string parameter, which will contain single digit numbers, letters,
# and question marks, and check if there are exactly 3 question marks between every pair of two numbers that add up to 10.
# If so, then your program should return the string true, otherwise it should return the string false.
# If there aren't any two numbers that add up to 10 in the string, then your program should return false as well.
#
# For example:
# if str is "arrb6???4xxbl5???eee5" then your program should return true because there are exactly 3 question marks
# between 6 and 4, and 3 question marks between 5 and 5 at the end of the string.
#
# Examples
# Input: "aa6?9"
# Output: false
#
# Input: "acc?7??sss?3rr1??????5"
# Output: true

require_relative("benchmark_helper")
require("test/unit/assertions")

include(Test::Unit::Assertions)

def questions_marks(str)
  result = []

  question_marks = 0
  number_found = false
  number = 0

  str.chars.each_with_index do |c, i|
    if c.match?(/\d/)
      if number + c.to_i == 10
        number = c.to_i
        result << (question_marks == 3)
        question_marks = 0
      else
        number_found = true
        question_marks = 0

        number = c.to_i
      end
    elsif number_found && c == '?'
      question_marks += 1
    end
  end

  return false if result.empty?

  result.all?(true)
end

BenchmarkHelper.measure do
  assert_equal(questions_marks("aa6?9"), false)
  assert_equal(questions_marks("acc?7??sss?3rr1??????5"), true)
  assert_equal(questions_marks("arrb6???4xxbl5??eee5"), false)
  assert_equal(questions_marks("5??aaaaaaaaaaaaaaaaaaa?5?5"), false)
end
