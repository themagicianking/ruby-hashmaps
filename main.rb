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
    new_list = LinkedList.new
    new_list.append(value)
    @bucket[key] = value
  end

  def get(key)
    if @bucket.length < key
      @bucket[key].at(0)
    end
  end

  def key?(key)
    if @bucket.length < key
      true
    else
      false
    end
  end

  def remove(key)
    let value
    if @bucket.length < key
      value = @bucket[key.head]
      @bucket[key].pop
    else
      value = nil
    end
    value
  end

  def length
    @bucket.length
  end

  def clear
    @bucket = Array.new(16, LinkedList.new)
  end

  # def keys
    # x = @bucket.length
    # array_of_keys = []
    # for loop through length of bucket ?
  # end

  # def values
  # end

  # def entries
  # end
  attr_accessor :bucket, :index
end

map = HashMap.new

pet_names = ['Speedsqueak', 'Austin', 'Luke', 'Misty', 'Thunder', 'Clarence', 'Juno', 'Blackberry', 'Firefly', 'Compass', 'Mark', 'Khoshekh', 'Dromio', 'Lady Macbetta', 'Cerberus', 'Arcadia']

pet_names.each do |name| 
  map.set(map.hash(name), name)
  # puts map.bucket[map.hash(name)]
  puts map.bucket
  puts map.bucket.length
end
