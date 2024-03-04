# Spiral Matrix
# In this challenge, transform a string into a spiral contained inside a regular square matrix. To build the matrix, you are given the dimension of its side:
#
#                                                                                                                                                         If the side of the matrix is odd, the spiral starting point will be the exact center of the matrix.
#   If the side of the matrix is even, the spiral starting point will be placed in the lower columns half of the lower rows half.
#   # "x" represents the matrix center
#
#   side = 3 (odd)
# matrix = [
#   [" ", " ", " "],
#   [" ", "x", " "],
#   [" ", " ", " "]
# ]
#
# side = 4 (even)
# matrix = [
#   [" ", " ", " ", " "],
#   [" ", "x", " ", " "],
#   [" ", " ", " ", " "],
#   [" ", " ", " ", " "],
# ]
# The length of the string has to match exactly the number of cells inside the matrix:
#
#                                                                                If the string length is greater than the number of cells, you have to cut off the unnecessary characters.
#   If the string length is lower than the number of cells, you have to add a series of "+" to the end of the string until its length match the number of cells.
#   side = 3 (9 cells)
# string = "EDABITTEROUS"
# # You'll need only "EDABITTER", while "OUS" is discarded.
# string = "EDABITTER"
#
# side = 4 (16 cells)
# string = "EDABITTEROUS"
# # You'll need all the string plus 4 "+" to match the cells.
# string = "EDABITTEROUS++++"
# Starting from the center that you found, you have to fill a regular square matrix side * side placing the characters of the given string str, following a clockwise spiral pattern (first move to the right).
#
#   side = 3 (odd)
# string = "EDABITTEROUS"
# matrix = [
#   ["T", "E", "R"],
#   ["T", "E", "D"],
#   ["I", "B", "A"]
# ]
#
# side = 4 (even)
# string = "EDABITTEROUS"
# matrix = [
#   ["T", "E", "R", "O"],
#   ["T", "E", "D", "U"],
#   ["I", "B", "A", "S"],
#   ["+", "+", "+", "+"],
# ]
# Examples
# spiral_matrix(2, "DOG") ➞ [
#   ["D", "O"],
#   ["+", "G"]
# ]
#
# spiral_matrix(3, "COPYRIGHTS") ➞ [
#   ["G", "H", "T"],
#   ["I", "C", "O"],
#   ["R", "Y", "P"]
# ]
#
# spiral_matrix(4, "SUPERLUMBERJACK") ➞ [
#   ["U", "M", "B", "E"],
#   ["L", "S", "U", "R"],
#   ["R", "E", "P", "J"],
#   ["+", "K", "C", "A"]
# ]
# Notes
# Remember, the first move from the center is to the right, and then you proceed clockwise and concentrically.
#   As given side, you can expect any valid value greater than 1.

require_relative("benchmark_helper")
require("test/unit/assertions")

include(Test::Unit::Assertions)

def spiral_matrix(side, string)
  matrix = Array.new(side){Array.new(side)}
  center = side / 2
  center -= 1 if side.even?
  r, c = center, center

  word_arr = string[0..(side*side)-1].ljust(side*side, "+").chars

  matrix[r][c] = word_arr.first

  i = 1
  iteration = 1
  while i < word_arr.size
    mult = iteration.even? ? -1 : 1

    iteration.times do
      c += mult * 1
      matrix[r][c] = word_arr[i]
      i += 1

      return matrix if i == word_arr.size
    end
    iteration.times do
      r += mult * 1
      matrix[r][c] = word_arr[i]
      i += 1

      return matrix if i == word_arr.size
    end

    iteration += 1
  end
end

BenchmarkHelper.measure do
  assert_equal(spiral_matrix(2, "DOG"), [
    [ "D", "O" ],
    [ "+", "G" ]
  ])

  assert_equal(spiral_matrix(3, "COPYRIGHTS"), [
    [ "G", "H", "T" ],
    [ "I", "C", "O" ],
    [ "R", "Y", "P" ]
  ])

  assert_equal(spiral_matrix(3, "EDABITTER"), [
    [ "T", "E", "R" ],
    [ "T", "E", "D" ],
    [ "I", "B", "A" ]
  ])

  assert_equal(spiral_matrix(3, "EDABITTEROUS"), [
    [ "T", "E", "R" ],
    [ "T", "E", "D" ],
    [ "I", "B", "A" ]
  ])

  assert_equal(spiral_matrix(4, "SUPERLUMBERJACK"), [
    [ "U", "M", "B", "E" ],
    [ "L", "S", "U", "R" ],
    [ "R", "E", "P", "J" ],
    [ "+", "K", "C", "A" ]
  ])

  assert_equal(spiral_matrix(4, "EDABITTEROUS"), [
    [ "T", "E", "R", "O" ],
    [ "T", "E", "D", "U" ],
    [ "I", "B", "A", "S" ],
    [ "+", "+", "+", "+" ]
  ])

  assert_equal(spiral_matrix(5, "ABOUTLIFETHEUNIVERSEANDEVERYTHING"), [
    [ "A", "N", "D", "E", "V" ],
    [ "E", "I", "F", "E", "T" ],
    [ "S", "L", "A", "B", "H" ],
    [ "R", "T", "U", "O", "E" ],
    [ "E", "V", "I", "N", "U" ]
  ])

  assert_equal(spiral_matrix(5, "THEUNBEARABLESPIRAL"), [
    [ "+", "+", "+", "+", "+" ],
    [ "+", "E", "A", "R", "A" ],
    [ "L", "B", "T", "H", "B" ],
    [ "A", "N", "U", "E", "L" ],
    [ "R", "I", "P", "S", "E" ]
  ])

  assert_equal(spiral_matrix(6, "SHESELLSSHELLSBYTHESEASHOREWITHOUTASHELLSSELLINGLICENSE"), [
    [ "E", "A", "S", "H", "O", "R" ],
    [ "S", "L", "S", "S", "H", "E" ],
    [ "E", "L", "S", "H", "E", "W" ],
    [ "H", "E", "S", "E", "L", "I" ],
    [ "T", "Y", "B", "S", "L", "T" ],
    [ "S", "A", "T", "U", "O", "H" ]
  ])
end
