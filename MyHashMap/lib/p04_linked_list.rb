
class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @prev.next = @next
    @next.prev = @prev
    @next, @prev = nil, nil
  end
end

class LinkedList
  include Enumerable
  attr_reader :head, :tail
  def initialize
    @head = Node.new
    @tail = Node.new

    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    return true if @head.next == @tail
    false
  end

  def get(key)
    node = get_node(key)
    return nil if node.nil?
    node.val
  end

  def include?(key)
    return true if get_node(key)
    false
  end

  def append(key, val)
    node = Node.new(key, val)
    node.next = @tail
    node.prev = @tail.prev
    @tail.prev.next = node
    @tail.prev = node
  end

  def get_node(key)
    node = @head.next
    until node.key == key
      return nil if node.next == nil
      node = node.next
    end
    node
  end

  def update(key, val)
    node = get_node(key)
    return nil if node.nil?
    node.val = val
  end

  def remove(key)
    node = get_node(key)
    node.remove
  end

  def each(&prc)
    node = @head
    until node.next == @tail
      prc.call(node.next.key, node.next.val)
      node = node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
