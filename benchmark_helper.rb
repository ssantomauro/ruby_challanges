
require('benchmark')

module BenchmarkHelper

  class << self

    # Usage Example
    #
    # BenchmarkHelper.measure("Execution time:") { block_to_benchmark }
    #
    def measure(caption = "Benchmark:")
      block_result = nil
      puts("#{caption} #{(Benchmark.measure { block_result = yield }.real * 1000).to_f.round(2)} ms")
      block_result
    end

  end

end