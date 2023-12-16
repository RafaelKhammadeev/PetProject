require 'benchmark'

class String
  def my_reverse
    str = ""
    each_char do |sym|
      str = sym + str
    end

    str
  end

  def array_reverse
    arr = []
    each_char do |sym|
      arr.unshift(sym)
    end

    arr.join('')
  end
end

Benchmark.bm do |x|
  x.report("my_reverse:") {"asdf".my_reverse}
  x.report("arr_reverse:") {"asdf".array_reverse}
  x.report("reverse:") {"asdf".reverse} 
end
