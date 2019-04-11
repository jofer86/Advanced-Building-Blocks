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

  def my_all?
    all = true
    self.my_each do |ele|
      if yield(ele) == false
        return false
      else
        ele
      end
    end
    all
  end

end









arr = [5, 8, 9, 4, 7, 6, 8, 10]
# Test my_each
arr.my_each { |ele| puts ele * 2 }

# Test my_each_with_index
arr.my_each_with_index { |ele, idx| puts "#{ele} is in index #{idx}" }

# Test my_select
my_s = arr.my_select{ |ele| ele.even? }
puts my_s

# Test my_all?
puts arr.my_all?{ |n| n == 0 }
