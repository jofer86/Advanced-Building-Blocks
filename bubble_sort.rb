def bubble_sort(array)
	sorted = false

	while sorted == false
		sorted = true
		(0...array.length-1).each do |i|
			if array[i] > array[i+1]
				array[i], array[i+1] = array[i+1], array[i]
				sorted = false
			end
			
		end
	end
	return array
end

print bubble_sort(["cat", "mouse", "rabbit", "c'thulu", "pikachu"])
puts

print bubble_sort([4, 5, 2, 6, 8, 7, 1, 102, 5, 3, 45, 85])
puts 
puts "--------------------------------"

def bubble_sort_by(arr)
	sorted = false
	while sorted == false
		sorted = true
		(0...arr.length-1).each do |i|
			if yield(arr[i], arr[i+1]) > 0
				arr[i], arr[i+1] = arr[i+1], arr[i]
				sorted = false
			end
		end
	end
	return arr
end



print bubble_sort_by(["hi","hello","hey", "waddup", "exquize me", "dance", "revolution of the machines"]) {|left,right| left.length - right.length}
puts
