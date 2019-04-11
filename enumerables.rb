# Enumerable module.
$proc= proc do |n|
  n * 2
end

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
      end
    end
    arr
  end

  def my_all?
    all = true
    self.my_each do |ele|
      if yield(ele) == false
        return false
      end
    end
    all
  end

  def my_any?
    any = false
    self.my_each do |ele|
      if yield(ele) == true
        return true
      end
    end
    any
  end

  def my_none?
    none = true
    self.my_each do |ele|
      if yield(ele) == true
        return false
      end
    end
    none
  end

  def my_count
    count = 0
    self.my_each do |ele|
      if yield(ele) == true
      count += 1
      end
    end
    count
  end

  def my_map
    arr = []
    if $proc
      self.my_each do |ele|
        arr << $proc.call(ele)
      end
      return arr
    end
    if block_given?
      self.my_each do |ele|
        arr << yield(ele)
      end
    end
    arr
  end

  def my_inject(acc = self[0])
    self.my_each do |ele|
      if ele == acc
        next
      else
      acc = yield(acc, ele)
      end
    end
    acc
  end

  def multiply_els
    total = self.my_inject{ |acc, ele| acc * ele}
    total
  end
end

# Test Case
arr = [5, 8, 9, 4, 7, 6, 8, 10]

# Test my_each
puts 'Test my_each'
puts  arr.my_each { |ele| puts ele * 2 }
puts '------------------------------'

# Test my_each_with_index
puts 'Test my_each_with_index'
arr.my_each_with_index { |ele, idx| puts "#{ele} is in index #{idx}" }
puts '------------------------------'

# Test my_select
puts 'test my_select'
my_s = arr.my_select{ |ele| ele.even? }
print my_s
puts
puts '------------------------------'

# Test my_all?
puts 'test my_all?'
puts arr.my_all?{ |n| n == 0 }
puts arr.my_all?{ |n| n.is_a? Integer}
puts '------------------------------'

# Test my_any?
puts 'test my_any?'
puts arr.my_any? { |n| n == 8}
puts arr.my_any? { |n| n == 154}
puts '------------------------------'

# Test my_none?"
puts 'Test my_none'
puts arr.my_none? { |n| n == 1 }
puts arr.my_none? { |n| n == 8 }
puts '------------------------------'

# Test my_count
puts 'Test my_count'
puts arr.my_count { |n| n.even? }
puts arr.my_count { |n| n == 8 }
puts '------------------------------'

# Test my_map
puts 'Test my_map'
my_m = arr.my_map { |n| n * 4}
print my_m
puts
puts '------------------------------'

# Test my_inject
puts 'Test my_inject'
my_i = arr.my_inject { |acc, ele| acc + ele}
puts my_i
puts [2, 5, 4].multiply_els



