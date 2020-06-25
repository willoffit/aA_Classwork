require 'sample_problems'

describe Array do
  describe "#uniq" do
    it "should return an empty array when the input array is empty" do
      expect([].uniq).to be_empty
    end

    it "should return itself when an array contains only one element" do
      expect([2].uniq).to eq([2])
    end

    it "should return itself when an array does not include duplicates" do
      expect([1, 2].uniq).to eq([1, 2])
    end

    it "should return only unique numbers" do
      expect([1, 2, 1, 3, 3].uniq).to eq([1, 2, 3])
    end
  end


  describe "#two_sum" do
    it "should return empty array when input array is empty" do 
      expect([].two_sum).to be_empty
    end

    it "should return empty array when array only contains one element" do 
      expect([2].two_sum).to be_empty
    end
    
    it "should return an empty array when no pair's sum is zero" do 
      expect([2, 1, 3].two_sum).to be_empty
    end

    it "should return the pair of indices whose elements sum to zero" do 
      expect([-1, 1].two_sum).to eq([[0, 1]])
    end

    it "should return an array which the larger indices comes after the smaller indicies" do 
      expect([-2, -1, 0, 1, 2].two_sum).to eq([[0, 4], [1, 3]])
    end
  end
end

describe "#my_transpose" do
  it "should transpose array" do
    expect(my_transpose([[0, 1, 2], [3, 4, 5], [6, 7, 8]])).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
  end
end

describe "stock_picker" do
  it "should pick the most profitable pairs of days on which to buy and sell the stocks" do
    expect(stock_picker([5, 1, 2, 8, 3])).to eq([1, 3])
  end 
end

describe TowersOfHanoi do
  subject(:towersofhanoi) { TowersOfHanoi.new }

  describe "#initialize" do
    it "should set disc to to initial state" do
      expect(towersofhanoi.discs).to eq([[3, 2, 1], [], []])
    end
  end

  
  describe "#move" do

    it "shouldn't raise an error" do 
      expect { towersofhanoi.move(0, 1) }.not_to raise_error
    end
    
    it "allows movement to empty space" do
      t = TowersOfHanoi.new
      t.move(0, 1)
      expect(t.discs).to eq([3, 2], [1], [])
    end

    it "allows movement from smaller disc on top of a larger disc" do
      t = TowersOfHanoi.new
      t.move(0, 1)
      t.move(0, 2)
      t.move(1, 2)
      expect(t.discs).to eq([3], [], [1, 2])
    end

    it "raise an error when move larger disc on top of a smaller disc"
      t = TowersOfHanoi.new
      t.move(0, 1)
      expect { t.move(0, 1) }.to raise_error("cannot move on the top of a smaller disc")
    end

    it "raise an error when we try to move from an empty space" do
      expect { towersofhanoi.move(1, 0) }.to raise_error("cannot move from an empty space")
    end
 
  describe "#render" do
    it "should print the towers" do
      expect(towersofhanoi.render).to eq("3,2,1 :  :  ")
    end
  end

  describe "won?" do
    context "when the initial tower pillar is empty" do
      it "should return true" do 
        towersofhanoi.discs = [[], [3, 2, 1], []]
        expect(towersofhanoi.won?).to be true
      end
        
    context "when the initial tower pillar has at least one disc" do
      it "should return false"
        expect(towersofhanoi.won?).to be false
      end
    end
  end
end








