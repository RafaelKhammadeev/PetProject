require "pry"

class Array
  def map_2x
    map{|x| x*2}.inspect
  end

  
  def yield_map_2x
    result = []
    
    if block_given?
      each { |element| result << yield(element) * 2 }

      result.inspect
    else
      puts "block not given"
    end
  end

  def block_map_2x(&block)
    result = []
    each { |element| result << block.call(element) * 2 }
    result.inspect
  end
end

puts [1,2,3].map_2x
puts [1,2,3].yield_map_2x
puts [1,2,3].block_map_2x { |x| x*2 }