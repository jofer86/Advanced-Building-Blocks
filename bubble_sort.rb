def bubble_sort(array)
	(0...array.length-1).each do |i|
		if array[i] > array[i+1]
			array[i], array[i+1] = array[i+1], array[i]
		end
	end
	return array
end

print bubble_sort([5, 6, 8, 9, 7, 9, 6, 4, 2, 8, 6, 2, 4])
puts
