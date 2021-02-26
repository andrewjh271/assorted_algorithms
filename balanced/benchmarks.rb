require 'benchmark'

module Benchmarks
  STRINGS = %w[
    azABaabza
    TacoCat
    AcZCbaBz
    abcdefghijklmnopqrstuvwxyz
    abcdefgHIJABCDEFGahij
  ].freeze

  def benchmark
    n = 100000

    Benchmark.bm do |benchmark|
      benchmark.report('Additional guard clause: ') do
        n.times do
          STRINGS.each do |string|
            Balanced.balancedFragmentLength(string)
          end
        end
      end
    end
  end

end