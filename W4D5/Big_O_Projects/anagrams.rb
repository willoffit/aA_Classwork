require "byebug"


# n!
def first_anagram?(string, target)
    string.split("").permutation.to_a.map(&:join).include?(target)
end


# n^2
def second_anagram?(string, target)
    string.each_char.with_index do |char, idx|
    target_idx = target.split("").find_index(char)
    next if target_idx.nil?
    target = target[0...target_idx] + target[(target_idx + 1)..-1]
    return true if target.length == 0
  end

  false
end

# .sort is quicksort which is O(n * log n)
def third_anagram?(string, target)
    string.split("").sort == target.split("").sort
end

p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")    #=> true