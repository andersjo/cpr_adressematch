# coding: utf-8
require 'helper'

class TestCprNumericField < Test::Unit::TestCase
  def test_fill
    f = Cpr::NumericField.new('f1', 0..4)
    assert_equal "0"*5, f.fill
  end

  def test_read_integer
    f = Cpr::NumericField.new('f1', 3..5)
    assert_equal 100, f.read("XXX100XXXX")
    assert_equal 10, f.read("XXX010XXXX")
    assert_equal 0, f.read("XXX000XXXX")
  end

  def test_write_integer
    f = Cpr::NumericField.new('f1', 3..5)
    assert_equal "XXX100XXXX", f.write("XXX000XXXX", 100)
    assert_equal "XXX010XXXX", f.write("XXX000XXXX", 10)
    assert_equal "XXX000XXXX", f.write("XXX000XXXX", 0)
  end

  def test_write_overflow_fails
    f = Cpr::NumericField.new('f1', 3..5)
    assert_raise(RuntimeError) {
      f.write("XXX000XXXX", 1000)
    }
  end

end
