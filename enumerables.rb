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

  def my_any?
    any = false
    self.my_each do |ele|
      if yield(ele) == true
        return true
      else
        ele
      end
    end
    any
  end

  def my_none?
    none = true
    self.my_each do |ele|
      if yield(ele) == true
        return false
      else
        ele
      end
    end
    none
  end


end









arr = [5, 8, 9, 4, 7, 6, 8, 10]
# Test my_each
puts 'Test my each'
puts  arr.my_each { |ele| puts ele * 2 }
puts '------------------------------'

# Test my_each_with_index
puts 'Test each with index'
arr.my_each_with_index { |ele, idx| puts "#{ele} is in index #{idx}" }
puts '------------------------------'

# Test my_select
puts 'test my select'
my_s = arr.my_select{ |ele| ele.even? }
puts my_s
puts '------------------------------'

# Test my_all?
puts 'test my all'
puts arr.my_all?{ |n| n == 0 }
puts arr.my_all?{ |n| n.is_a? Integer}
puts '------------------------------'

# Test my_any?
puts 'test my any'
puts arr.my_any? { |n| n == 8}
puts arr.my_any? { |n| n == 154}
puts '------------------------------'

#Test my_none?"

puts arr.my_none? { |n| n == 1 }
puts arr.my_none? { |n| n == 8 }

