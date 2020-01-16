# frozen_string_literal: true

module Enumerable
  def my_each()
    0.upto(self.size-1) do |i|
      yield(self[i])
    end
  end

  def my_each_with_index()
    0.upto(self.size-1) do |i|
      yield(self[i],i)
    end
  end

end


a=[1,2,3,4,5,6,7]

a.my_each{ |v| puts 'value ' + v.to_s}
a.my_each_with_index(){ |v, k| puts 'value ' + v.to_s + ' index '+k.to_s }


# my_select in the same way, though you may use #my_each in your definition
# my_all? (continue as above)
# my_any?
# my_none?
# my_count
# my_map
# my_inject
