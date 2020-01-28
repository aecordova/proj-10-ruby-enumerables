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

end