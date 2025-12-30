if defined?(Ractor)
  class Ractor
    alias_method :value, :take unless method_defined?(:value)
  end
end


class RactorTest < Test::Unit::TestCase
  ractor
  test("Array#mean") do
    r = Ractor.new do
      [1, 2, 3, 4].mean
    end
    assert_equal(2.5, r.value)
  end
end
