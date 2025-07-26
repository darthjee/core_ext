# frozen_string_literal: true

class DummyIterator
  def initialize(array)
    @array = array
  end

  def map(*, &)
    @array.map(*, &)
  end

  def each(*, &)
    @array.each(*, &)
  end
end
