# frozen_string_literal: true

# Extending Enumerable module with replicated methods for the following:
# each, each_with_index, select,
#
module Enumerable
  def my_each
    arr = self # this is to prevent a redundant-use-of-self error
    0.upto(arr.length - 1) do |i|
      yield(arr[i])
    end
  end

  def my_each_with_index
    arr = self # this is to prevent a redundant-use-of-self error
    0.upto(arr.length - 1) do |i|
      yield(arr[i], i)
    end
  end

  def my_select
    arr = self # this is to prevent a redundant-use-of-self error
    result = []
    0.upto(arr.length - 1) do |i|
      result << arr[i] if yield(arr[i])
    end
    result
  end

  def my_any?
    arr = self # this is to prevent a redundant-use-of-self error
    response = true
    0.upto(arr.length - 1) do |i|
      response = false unless yield(arr[i])
    end
    response
  end
  def my_any?
    arr = self # this is to prevent a redundant-use-of-self error
    response = false
    0.upto(arr.length - 1) do |i|
      response = true if yield(arr[i])
    end
    response
  end

  
end
# tests
a = [1, 2, 3, 4, 5, 6, 7]

# a.my_each { |v| print 'value ' + v.to_s }
# a.my_each_with_index { |v, k| print 'value ' + v.to_s + ' index ' + k.to_s }
# print a.my_select{ |x| x % 2 == 0 }
# puts a.my_all?{ |x| x > 2 }
# puts a.my_any?{ |x| x > 4 }

# my_select in the same way, though you may use #my_each in your definition
# my_all? (continue as above)
# my_any?
# my_none?
# my_count
# my_map
# my_inject
