# Given the list of strings in the Sample Input below, display the Sample Output in the console.

# Sample Input
# /home/jack/diary/2023-04-01.txt
# /home/jack/diary/2023-04-02.txt
# /home/jack/photos/1.jpg

# Sample Output
# - home
#   - jack
#     - diary
#       - 2023-04-01.txt
#       - 2023-04-02.txt
#     - photos
#       - 1.jpg

require_relative("benchmark_helper")

hash = {}
files = [
  "/home/jack/diary/2023-04-01.txt",
  "/home/jack/diary/2023-04-02.txt",
  "/home/jack/photos/1.jpg"
].freeze

def merge_paths(h, path)
  arr = path[1..-1].split('/')
  top = arr[0]

  if arr.size == 2
    h[top] ||= []
    h[top] << arr.last
  else
    h[top] ||= {}
    merge_paths(h[top], "/#{arr[1..-1].join('/')}")
  end
end

def print_tree(hash, i)
  hash.each do |key, value|
    puts "#{Array.new(i) { "\t" }.join('')}- #{key}"

    if value.is_a?(Array)
      value.each { |file| puts "#{Array.new(i+1) { "\t" }.join('')}- #{file}" }
    else
      i += 1
      print_tree(value, i)
    end
  end
end

files.each { |path| merge_paths(hash, path) }

BenchmarkHelper.measure { print_tree(hash, 0) }