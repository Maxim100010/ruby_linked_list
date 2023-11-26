# frozen_string_literal: true

class LinkedList
  attr_accessor :head_node, :last_node

  def initialize
    @head_node = Node.new
    @last_node = @head_node
  end

  def append(value)
    if head_node.value.nil?
      head_node.value = value
    else
      new_last_node = (last_node.next_node = Node.new(value))
      self.last_node = new_last_node
    end
  end

  def prepend(value)
    if head_node.value.nil?
      head_node.value = value
    else
      self.head_node = Node.new(value, head_node)
    end
  end

  def head
    head_node.value
  end

  def tail
    last_node.value
  end

  def size
    has_next_node = head_node.next_node.nil? ? false : true

    return 0 if has_next_node == false && head_node.value.nil?

    following_node = head_node.next_node

    count = 1

    while has_next_node
      count += 1
      has_next_node = following_node.next_node
      following_node = following_node.next_node
    end
    count
  end

  def at(index)
    return head_node.value if index.zero?

    following_node = head_node.next_node

    (index - 1).times do
      following_node = following_node.next_node
    end

    following_node.nil? ?  'The list is smaller than the index you are looking for' : following_node.value
  end

  def pop
    return head_node.value = nil if head_node.next_node.nil?

    following_node = head_node.next_node

    following_node = following_node.next_node until following_node.next_node == last_node

    following_node.next_node = nil
  end

  def contains?(value)
    return true if head_node.value == value

    following_node = head_node.next_node

    (size - 1).times do
      return true if following_node.value == value

      following_node = following_node.next_node
    end
    false
  end

  def find(value)
    return 0 if head_node.value == value

    following_node = head_node.next_node

    counter = 1

    (size - 1).times do
      return counter if following_node.value == value

      counter += 1
      following_node = following_node.next_node
    end
    'The value is not present in the list'
  end

  def to_s
    str = "( #{head_node.value} ) -> "

    following_node = head_node.next_node

    (size - 1).times do
      str << "( #{following_node.value} ) -> "

      following_node = following_node.next_node
    end

    str << 'nil'
    str
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
