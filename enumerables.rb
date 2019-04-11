# Enumerable module.
module Enumerable
  def my_each
    for i in 0..self.length-1
      yield self[i]
    end
    self
  end

  def my_each_with_index
    for i in 0..self.length-1
      yield self[i], i
    end
    self
  end

  def my_select
    arr = []
    self.my_each do |ele|
      if yield(ele) == true
        arr << ele
      else
        ele
      end
    end
    arr
  end
end









arr = [5, 8, 9, 4, 7, 6, 8, 10]
arr.my_each { |ele| puts ele * 2 }
arr.my_each_with_index { |ele, idx| puts "#{ele} is in index #{idx}" }
my_s = arr.my_select{ |ele| ele.even? }
puts my_s

