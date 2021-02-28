require 'benchmark'

module Benchmarks
  STRINGS = %w[
    azABaabza
    TacoCat
    AcZCbaBz
    abcdefghijklmnopqrstuvwxyz
    abcdefgHIJABCDEFGahij
    catAttaCaTtaca
    catAttaCattacTa
    jsflsdifsjdflisjfsldkfjsldfkjdlsfiajfljlkclakdsjfasldkfjasifjsLFJSLFSKFJDKFJjkjsfladfjJKD
  ].freeze

  def benchmark
    n = 50000

    Benchmark.bm do |benchmark|
      benchmark.report('My original algorithm: ') do
        n.times do
          STRINGS.each do |string|
            Balanced.balanced_fragment_length(string)
          end
        end
      end
    end

    Benchmark.bm do |benchmark|
      benchmark.report('My algorithm w/ hashes: ') do
        n.times do
          STRINGS.each do |string|
            Balanced.balanced_fragment_length2(string)
          end
        end
      end
    end

    Benchmark.bm do |benchmark|
      benchmark.report('Merging interval algorithm: ') do
        n.times do
          STRINGS.each do |string|
            Balanced.balanced_fragment_length3(string)
          end
        end
      end
    end
  end

end