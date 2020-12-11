def quick_sort(arr)
  return arr if arr.length <= 1

  pivot = arr.delete_at(rand(arr.length))
  left = Array.new
  right = Array.new

  arr.each do |x|
      x <= pivot ? left << x : right << x
  end

  return *quick_sort(left), pivot, *quick_sort(right)
end

