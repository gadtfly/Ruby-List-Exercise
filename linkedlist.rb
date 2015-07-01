class Node
  attr_accessor :item
  attr_accessor :rest

  def initialize(obj)
    self.item = obj
  end

  def cons(obj)
    node = Node.new(obj)
    node.rest = self
    node
  end

  def size
    if self.rest
      1 + self.rest.size
    else
      1
    end
  end

  def dump
    puts self.item
    if self.rest
      self.rest.dump
    end
  end

  def removeAllWithValue(obj)
    if self.item == obj
      self.rest.removeAllWithValue(obj)
    else
      node = Node.new(self.item)
      node.rest = self.rest.removeAllWithValue(obj)
    end
  end
end


list = Node.new(1).cons(2).cons(2).cons(3)
# p list.size
# list.dump
list = list.removeAllWithValue(2)
list.dump