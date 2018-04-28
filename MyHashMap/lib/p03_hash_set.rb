require 'byebug'
require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if include?(num)
      return
    else
      if @count+ 1 > num_buckets
        resize!
      end
      self[num] << num
      @count += 1
    end
  end

  def include?(num)
    debugger
    self[num].include?(num)
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  # private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_length = num_buckets * 2
    store2 = Array.new(new_length) { Array.new }
    @store.each do |bucket|
      bucket.each do |num|
        store2[num % new_length] << num
      end
    end
    @store = store2
  end
end
