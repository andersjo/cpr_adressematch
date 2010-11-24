# coding: utf-8
require 'helper'

class TestCprNumericField < Test::Unit::TestCase
  def test_read_integer
    f = Cpr::NumericField.new('f1', 3..5)
    assert_equal 100, f.read("XXX100XXXX")
    assert_equal 10, f.read("XXX010XXXX")
    assert_equal 0, f.read("XXX000XXXX")
    assert_nil f.read("XXX   XXXX")
  end

  def test_write_integer
    f = Cpr::NumericField.new('f1', 3..5)
    assert_equal "XXX100XXXX", f.write("XXX000XXXX", 100)
    assert_equal "XXX010XXXX", f.write("XXX000XXXX", 10)
    assert_equal "XXX000XXXX", f.write("XXX000XXXX", 0)
    assert_equal "XXX   XXXX", f.write("XXX000XXXX", nil)
  end

  def test_write_overflow_fails
    f = Cpr::NumericField.new('f1', 3..5)
    assert_raise(RuntimeError) {
      f.write("XXX000XXXX", 1000)
    }
  end

end
