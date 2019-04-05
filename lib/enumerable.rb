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
    i = 0
    while i < length
      yield(at(i), i)
      i += 1
    end
    self
  end

  def my_inject(carry = at(0))
    i = carry == at(0) ? 1 : 0
    while i < length
      carry = yield(carry, at(i))
      i += 1
    end
    carry
  end
  alias my_reduce my_inject
end
