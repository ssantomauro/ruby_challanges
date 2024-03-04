# How Many Unique Styles?
# There are many different styles of music and many albums exhibit multiple styles.
# Create a function that takes a list of musical styles from albums and returns how many styles are unique.
#
#   Examples
# unique_styles([ "Dub,Dancehall", "Industrial,Heavy Metal", "Techno,Dubstep", "Synth-pop,Euro-Disco", "Industrial,Techno,Minimal" ]) ➞ 9
# unique_styles([ "Soul", "House,Folk", "Trance,Downtempo,Big Beat,House", "Deep House", "Soul" ]) ➞ 7

require_relative("benchmark_helper")
require("test/unit/assertions")

include(Test::Unit::Assertions)

def unique_styles(albums)
  albums.flat_map { |album| album.split(",") }.uniq.size
end

BenchmarkHelper.measure do
  assert_equal(unique_styles([ "Dub,Dancehall", "Industrial,Heavy Metal", "Techno,Dubstep", "Synth-pop,Euro-Disco", "Industrial,Techno,Minimal" ]), 9)
  assert_equal(unique_styles([ "Soul", "House,Folk", "Trance,Downtempo,Big Beat,House", "Deep House", "Soul" ]), 7)
end
