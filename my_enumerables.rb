module Enumerable
  # Your code goes here
  def my_each_with_index
    return unless block_given?

    i = 0
    for el in self
      yield el, i
      i += 1
    end
    self
  end

  def my_all?
    for el in self
      return false unless yield el
    end
    true
  end

  def my_any?
    for el in self
      return true if yield el
    end
    false
  end

  def my_none?
    for el in self
      return false if yield el
    end
    true
  end

  def my_select
    selected = []
    for el in self
      selected << el if yield el
    end
    selected
  end

  def my_map
    mapped = []
    for el in self
      mapped << yield(el)
    end
    mapped
  end

  def my_inject
    init_val = 0
    for el in self
      init_val += yield(init_val, el)
    end
    init_val
  end

  def my_count
    return size unless block_given?

    count = 0
    for el in self
      count += 1 if yield(el)
    end
    count
    # enumerable.my_count { |value| value > 5 })
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return unless block_given?

    for el in self
      yield el
    end
    self
  end
end
