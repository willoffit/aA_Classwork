require "byebug"

def my_min(array)

    #time complexity here is O(n^2)
    # array.each_with_index do |ele, idx|
    #     min_value = true
    #     array.each_with_index do |comparison, idx|
    #         if ele > comparison
    #             min_value = false
    #         end
    #     end
    #     return ele if min_value
    # end

    #time complexity here is O(n)
    min_value = 0
    array.each_with_index do |ele, idx|
        min_value = ele if min_value > ele
    end
    min_value

end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# puts my_min(list)



def largest_contiguous_subsum(list)
  # Time complexity here is O(n^3)
  # subs = []
  # (0...list.length).each do |start_idx|
  #     (start_idx...list.length).each do |end_idx|
  #         sub = list[start_idx..end_idx]
  #         subs << sub
  #     end
  # end

  # subs.map(&:sum).max

  # Time complexity of O(n)
  largest_sum = list.min
  current_sum = 0 # 5

  list.each do |ele|
    current_sum += ele

    if current_sum > largest_sum
      largest_sum = current_sum
    elsif current_sum < 0
      current_sum = 0
    end
  end

  largest_sum
end

