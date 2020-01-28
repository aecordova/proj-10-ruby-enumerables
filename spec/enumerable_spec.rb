require_relative './my_enumerable_module.rb'

describe Enumerable do
  describe "#my_each" do
    it "Returns the same array if block is given" do
      expect([5, 6, 7].my_each{|x| x}).to eql([5, 6, 7])
    end
    it "Returns an enumerable if block is not given" do
      expect([5, 6, 7].my_each.class).to eql(Enumerator)
    end
  end
end