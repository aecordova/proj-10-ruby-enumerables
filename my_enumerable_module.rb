# frozen_string_literal: true

# Extending Enumerable module with replicated methods for the following:
# each, each_with_index, select, all?, none?, any?, count, map and inject
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

  def my_all?
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

  def my_none?
    arr = self # this is to prevent a redundant-use-of-self error
    response = true
    0.upto(arr.length - 1) do |i|
      response = false if yield(arr[i])
    end
    response
  end

  def my_count(single_value = nil)
    arr=self
    counter = 0
    if single_value
      arr.my_each { |val| counter += 1 if val == single_value }
    else
      arr.my_each { |val| counter += 1 if yield(val) }
    end
    counter
  end

  def my_map(a_proc = nil)
    arr = self # this is to prevent a redundant-use-of-self error
    if block_given? && a_proc.nil?
      arr.my_each_with_index { |v, i| arr[i] = yield(v) }
    else
      arr.my_each_with_index { |v, i| arr[i] = a_proc.call(v) }
    end
    arr
  end

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def my_inject(init = 0, oper = :+)
    obj = self
    if init.is_a? Symbol
      oper = init
      init = 0
    end
    accum = obj[init]
    if block_given?
      (init + 1).upto(obj.length - 1) { |i| accum = yield(accum, obj[i]) }
    else
      (init + 1).upto(obj.length - 1) { |i| accum = accum.send(oper, obj[i]) }
    end
    accum
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength
end

# TESTS
# print "\n my_each: \n"
# [1,2,3,4,5,6,7].my_each { |v| print "  val: #{v}\n" }
#
# print "\n my_each_with_index: \n"
# [1,2,3,4,5,6,7].my_each_with_index { |v, k| print "  val: #{v}  ind: #{k} \n" }
#
# print "\n my_select: "
# print [1,2,3,4,5,6,7].my_select{ |x| x % 2 == 0 }
#
# print "\n\n my_all?: "
# puts [1,2,3,4,5,6,7].my_all? { |x| x > 2 }
#
# print "\n my_any?: "
# puts [1,2,3,4,5,6,7].my_any?{ |x| x > 4 }
#
# print "\n my_my_none?: "
# puts [1,2,3,4,5,6,7].my_none? { |x| x > 1 }
#
# print "\n my_count using a block:"
# puts [1,2,3,4,5,6,7].my_count { |x| x > 4 }
#
# print "\n my_count using an argument:"
# puts [1,2,3,4,5,6,7].my_count(3)
#
# print "\n my_map using a block:"
# puts [1,2,3,4,5,6,7].my_map { |x| x ** 4 }
#
# print "\n my_inject using a block:"
# puts [1,2,3,4,5,6,7].my_inject { |running_total, number| running_total + number }
#
# print "\n my_inject using an  operator as a symbol:"
# puts [1,2,3,4,5,6,7].my_inject(:*)
#
# print "\n Defining and using multiply_els for testing my_inject: "
# def multiply_els(arr)
#   arr.my_inject(:*)
# end
# puts multiply_els([2, 4, 5])
# print "\n Defining a proc to be used with my_map: \n"
# some_proc = Proc.new { |x| x ** 4 }
#
# print "\n Using my_map with a proc and with both a prc and a block: \n"
# puts [1,2,3,4,5,6,7].my_map(some_proc)
# puts [1,2,3,4,5,6,7].my_map() { |x| x ** 4 }
