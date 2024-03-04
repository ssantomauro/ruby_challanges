# Longest Word
# Have the function LongestWord(sen) take the sen parameter being passed and return the longest word in the string.
# If there are two or more words that are the same length, return the first word from the string with that length.
# Ignore punctuation and assume sen will not be empty. Words may also contain numbers, for example "Hello world123 567"
# Examples
# Input: "fun&!! time"
# Output: time
#
# Input: "I love dogs"
# Output: love

require_relative("benchmark_helper")
require("test/unit/assertions")

include(Test::Unit::Assertions)

def longest_word(sen)
  arr = sen.split

  shortest = ""
  arr.each do |word|
    sanitized = word.scan(/[A-za-z0-9]/).join
    shortest = sanitized if sanitized.size > shortest.size
  end

  shortest
end

BenchmarkHelper.measure do
  assert_equal(longest_word("fun&!! time"), "time")
  assert_equal(longest_word("I love dogs"), "love")
end
