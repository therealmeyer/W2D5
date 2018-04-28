require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  attr_reader :count
  include Enumerable
  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end


  def include?(key)
    list = bucket(key)
    list.include?(key)
  end

  def set(key, val)
    list = bucket(key)
    if list.include?(key)
      list.update(key, val)
    else
      if @count + 1 > num_buckets
        resize!
      end
      list.append(key, val)
      @count += 1
    end
  end

  def get(key)
    list = bucket(key)
    list.get(key)
  end

  def delete(key)
    if include?(key)
      list = bucket(key)
      list.remove(key)
      @count -= 1
    end
  end

  def each(&prc)
    @store.each do |list|
      list.each(&prc)
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_length = num_buckets * 2
    store2 = Array.new(new_length) { LinkedList.new }
    @store.each do |list|
      list.each do |key, value|
        store2[key.hash % new_length].append(key,value)
      end
    end
    @store = store2
  end

  def bucket(key)
    @store[key.hash % num_buckets]
    # optional but useful; return the bucket corresponding to `key`
  end
end
