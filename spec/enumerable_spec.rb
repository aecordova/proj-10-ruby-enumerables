require_relative '../my_enumerable_module.rb'

describe Enumerable do
  describe "#my_each" do
    it "Returns the same array if block is given" do
      expect([5, 6, 7].my_each{|x| x}).to eql([5, 6, 7])
    end
    it "Returns an enumerable if block is not given" do
      expect([5, 6, 7].my_each.class).to eql(Enumerator)
    end
  end
  describe "#my_each_with_index" do
    it "Returns the same array if block is given" do
      expect([5, 6, 7].my_each_with_index{|x,y| x+y}).to eql([5, 6, 7])
    end
    it "Returns an enumerable if block is not given" do
      expect([5, 6, 7].my_each_with_index.class).to eql(Enumerator)
    end
  end
  describe "#my_select" do
    it "Returns result of the condition inside the block if block is given" do
      expect([5, 6, 7].my_select{|x| x.odd?}).to eql([5, 7])
    end
    it "Returns an enumerable if block is not given" do
      expect([5, 6, 7].my_select.class).to eql(Enumerator)
    end
  end
  describe "#my_all?" do
    it "Returns true if all array's values satisfy the condition of the given block" do
      expect([5, 6, 7].my_all?{|x| x.is_a?(Integer)}).to eql(true)
    end
    it "Returns true if no block nor argument is given" do
      expect([5, 6, 7].my_all?).to eql(true)
    end
    it "Returns true if all array's values satisfy the condition of the given argument" do
      expect([5, 6, 7].my_all?(Integer)).to eql(true)
    end
  end
  describe "#my_any?" do
    it "Returns true if at least one array's values satisfy the condition of the given block" do
      expect([5, 6, 7].my_all?{|x| x.is_a?(Integer)}).to eql(true)
    end
    it "Returns true if no block nor argument is given" do
      expect([5, 6, 7].my_all?).to eql(true)
    end
    it "Returns true if at least one array's values satisfy the condition of the given argument" do
      expect([5, 6, 7].my_all?(Integer)).to eql(true)
    end
  end
  describe "#my_none?" do
    it "Returns true if no values satisfy the condition of a block" do
      expect([5, 6, 7].my_none?{|x| x.is_a?(String)}).to eql(true)
    end
    it "Returns true the array is empty" do
      expect([].my_none?).to eql(true)
    end
    it "Returns false if no block is given and it's a Hash" do
      expect({key: 'val'}.my_none?).to eql(false)
    end
    it "if no argument is given returns false if all elements are false" do
      expect([false, nil, false].my_none?).to eql(true)
    end
    it "Returns true if no value satisfies the condition of the argument" do
      expect([5, 6, 7].my_none?(Integer)).to eql(false)
    end
  end
  describe "#my_count" do 
    it "If a block or arg is not given it returns the number of elements in the array" do
      expect([5,6,7].my_count).to eql(3)
    end
    it "If a block is not given it returns the number of elements matching the arg" do
      expect([5,6,7].my_count(6)).to eql(1)
    end
    it "If a block is given it returns the number of elements matching the block" do
      expect([5,6,7].my_count{|x| x > 5}).to eql(2)
    end
  end
  describe "#my_map" do
    it "returns an enumerator if no block is given" do
      expect([5, 6, 7].my_map.class).to eql(Enumerator)
    end
  end

end