def bubble_sort(array)
  sorted = false

  while sorted == false
    sorted = true
    (0...array.length - 1).each do |i|
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
        sorted = false
      end
    end
  end
  array
end

def bubble_sort_by(arr)
  sorted = false
  while sorted == false
    sorted = true
    (0...arr.length - 1).each do |i|
      if block_given?
        yield(arr[i], arr[i + 1]) > 0
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        sorted = false
      else
        return 'No block given'
      end
    end
  end
  arr
end
