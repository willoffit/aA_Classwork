
class Array

  def my_uniq
    return arrays if arrays.length < 1
    
    uniq_arr = []

    arrays.each do |ele|
      uniq_arr << ele unless uniq_arr.include?(ele)
    end

    uniq_arr
  end

  def two_sum
    pairs = []

    (0...self.length - 1).each do |idx_1|
        (idx_1 + 1...self.length).each do |idx_2|
            sum = self[idx_1] + self[idx_2]
            pair = [idx_1, idx_2]
            pairs << pair if sum.zero?
        end
    end

    pairs
  end
end

def my_transpose(arrays)
  tranpose_array = Array.new(arrays.length) { Array.new(arrays.length) }

  (0...arrays.length).each do |i|
    (0...arrays.length).each do |j|
      tranpose_array[j][i] = arrays[i][j]
    end
  end

  tranpose_array
end

def stock_picker(stock_prices)
    most_profit = 0
    pair = [0, 0]

    (0...stock_prices.length - 1).each do |buy|
        (buy + 1...stock_prices.length).each do |sell|
            profit = stock_prices[sell] - stock_prices[buy]
            pair, most_profit = [buy, sell], profit if profit > most_profit
        end
    end

   pair
end

class TowersOfHanoi
  def initialize
  end

  def move(num_1, num_2)
  end

  def render
  end

  def won?
  end
end


