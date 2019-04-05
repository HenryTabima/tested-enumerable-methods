# Extensión for enumerable module
module Enumerable
  def my_each
    i = 0
    while i < length
      yield(at(i))
      i += 1
    end
    self
  end

  def my_each_with_index
    # implementation
  end
end
