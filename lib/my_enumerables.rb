# require 'pry'

module Enumerable
  # Your code goes here
  def my_all? &block
    self.my_each{|el| return false unless block.call(el)}
    true
  end

  def my_any? &block
    self.my_each{|el| return true if block.call(el)}
    false
  end

  def my_count &block
    if block_given?
      count = 0
      self.my_each{|el| count += 1 if block.call(el)}
      return count
    end
    self.length
  end

  def my_each_with_index &block
    i = 0
    while(i < self.length)
      block.call(self[i], i)
      i += 1
    end
    self
  end

  def my_inject(init = self[0], &block)
    for el in self
      init = block.call(init, el)
    end
    init
  end

  def my_map &block
    copy = []
    self.my_each{|el| copy.push(block.call(el))}
    copy
  end

  def my_none? &block
    !self.my_any?(&block)
  end

  def my_select &block
    copy = []
    self.my_each{|el| copy.push(el) if block.call(el)}
    copy
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here

  def my_each &block
    # binding.pry
    for el in self
      block.call(el)
    end
    self
  end
end

