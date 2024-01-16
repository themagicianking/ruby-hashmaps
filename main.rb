# frozen_string_literal: true
require '../linked-lists/main'

# this class implements hashmaps
class HashMap
  LOAD_FACTOR = 0.75

  def initialize
    @bucket = Array.new(16)
    @capacity = 16
  end

  def hash(value)
    hash_code = 0
    prime_number = 31

    value.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code % @capacity
  end

  def set(key, value)
    if ((Float(@bucket.count - @bucket.count(nil)))/@capacity) >= (LOAD_FACTOR)
      @bucket = @bucket + Array.new(@capacity)
      @capacity = @bucket.length
    end
    new_list = LinkedList.new
    new_list.append(value)
    @bucket[key] = new_list
  end

  def get(key)
    if !@bucket[key].nil?
      @bucket[key].head.value
    end
  end

  def key?(key)
    bucket[key] ? true : false
  end

  def remove(key)
    value = bucket[key]
    bucket[key] = nil
    value
  end

  def length
    @bucket.length - @bucket.count(nil)
  end

  def clear
    @bucket = Array.new(16)
  end

  def keys
    array_of_keys = []
    array_of_values = @bucket.select { |bucket| !bucket.nil? }
    array_of_values.each { |value| array_of_keys.push(@bucket.index(value))}
    array_of_keys
  end

  def values
    sanitized_values = []
    array_of_values = @bucket.select { |bucket| !bucket.nil? }
    array_of_values.each { |node| sanitized_values.push(node.head.value) }
    sanitized_values
  end

  def entries
    array_of_entries = []
    self.values.each_with_index { |value, index| array_of_entries.push([self.keys[index], value])}
    array_of_entries
  end
  attr_accessor :bucket, :index
end
