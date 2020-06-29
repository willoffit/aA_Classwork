class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    self.join.to_i.hash
  end
end

class String
  def hash
    alph = ('a'..'z').to_a + ('A'..'Z').to_a
    string_num = ''
    self.each_char do |char|
      alpha_index = alph.index(char)
      string_num += alpha_index.to_s
    end

    string_num.to_i.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hash_array = []
    self.each do |k, v|
      hash_array << [k, v]
    end
    hash_array.sort.flatten.join.hash
  
    # 0
  end
end
