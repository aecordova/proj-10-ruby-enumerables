# frozen_string_literal: true

# Extending Enumerable module with replicated methods for the following:
# each, each_with_index, select, all?, none?, any?, count, map and inject
#
module Enumerable
  def my_each
    if block_given?
      arr = self # this is to prevent a redundant-use-of-self error
      0.upto(arr.length - 1) do |i|
        yield(arr[i])
      end
      arr
    else
      arr.to_enum
    end
  end

  def my_each_with_index
    if block_given?
      arr = self # this is to prevent a redundant-use-of-self error
      0.upto(arr.length - 1) do |i|
        yield(arr[i], i)
      end
    else
      arr.to_enum
    end
  end

  def my_select
    if block_given?
      arr = self # this is to prevent a redundant-use-of-self error
      result = []
      0.upto(arr.length - 1) do |i|
        result << arr[i] if yield(arr[i])
      end
      result
    else
      arr.to_enum
    end
  end

  # def my_all? (arg=nil)
  #   arr = self # this is to prevent a redundant-use-of-self error
  #   response = true
  #   if block_given? &&
  #     puts 'cond 1'
  #     arr.my_each { |i| response = false unless yield(arr[i]) }
  #   else
  #     case arg.class.to_s
  #     when 'Regexp'
  #       puts 'cond 2'
  #       arr.my_each {|val| return response = false unless arg.match? val.to_s }
  #     when 'Class'
  #       arr.my_each {|val| return response = false unless val.is_a? arg.to_s }
  #     else
  #       arr.my_each {|val| return response = false unless val == arg }
  #     end
  #   end
  #   response
  # end

  # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity

  def my_all?(arg=nil)
    resp = true
    return true if to_a.nil? || (self.class.to_s == 'Hash' && !block_given?)

    if block_given?
      to_a.my_each { |val| resp = false unless yield(val) }
    elsif arg.nil? 
      to_a.my_each { |val| resp = false unless val }
    else
      case arg.class.to_s
      when 'Regexp'
        to_a.my_each { |val| resp = false unless arg.match? val.to_s }
      when 'Class'
        to_a.my_each { |val| resp = false unless val.is_a? arg}
      else
        to_a.my_each { |val| return resp = false unless val == arg }
      end
    end
    resp
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
    arr = self
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

  # rubocop:disable Metrics/MethodLength
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
  # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
end

# rubocop:disable Layout/LineLength

# TEST CASES
# print "\n my_each: \n"
# [1,2,3,4,5,6,7].my_each { |v| print "  val: #{v}\n" }
# print "\n each: \n"
# [1,2,3,4,5,6,7].each { |v| print "  val: #{v}\n" }
# print "\n my_each without a block: \n"
# print [1,2,3,4,5,6,7].my_each
# print "\n each without a block: \n"
# print [1,2,3,4,5,6,7].each

# print [1,2,3,4,5,6,7].each { |v| v }
# print [1,2,3,4,5,6,7].my_each { |v| v }



# print "\n my_each_with_index: \n"
# [1,2,3,4,5,6,7].my_each_with_index { |v, k| print "  val: #{v}  ind: #{k} \n" }
# print "\n each_with_index: \n"
# [1,2,3,4,5,6,7].my_each_with_index { |v, k| print "  val: #{v}  ind: #{k} \n" }
# print "\n my_each_with_index without a block: \n"
# print [1,2,3,4,5,6,7].my_each
# print "\n each_with_index without a block: \n"
# print [1,2,3,4,5,6,7].each
#
# print "\n my_select: "
# print [1,2,3,4,5,6,7].my_select{ |x| x.even? }
# print "\n select: "
# print [1,2,3,4,5,6,7].my_select{ |x| x.even? }
# print "\n my_select without a block: "
# print [1,2,3,4,5,6,7].my_select
# print "\n select without a block: "
# print [1,2,3,4,5,6,7].my_select
#
# print "\n\n my_all?: "
# options = {:font_size => 10, :font_family => "Arial" }
# print options.my_all?
# puts [].my_all? {|x| x>2}
# puts [].my_all? 
# puts [1,2,3,4,5,6,7].my_all? {|x| x>0}
# puts [1,2,3,4,5,6,7].my_all? {|x| x>2}
# puts [1,2,3,4,5,6,7].my_all?
# puts [1,2,false,4,5,6,7].my_all?
# puts [1,2,3,4,5,6,7].my_all?(Integer)
# puts [1,2,3,4,5,6,7].my_all?(String)
# puts [1,2,3,4,5,6,7].my_all?(/[0-9]/)
puts [1,1,1,1,1,1].my_all?(2)
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
#
# rubocop:enable Layout/LineLength
