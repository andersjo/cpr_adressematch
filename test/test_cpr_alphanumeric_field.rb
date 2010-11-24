# coding: utf-8
require 'helper'

class TestCprAlphanumericField < Test::Unit::TestCase
  def test_read_welformed_string
    f = Cpr::Field.create_type('A', 'f1', 3..5)
    assert_equal "ABC", f.read("XXXABCXXXX")
    assert_equal "A", f.read("XXXA  XXXX")
    assert_equal "", f.read("XXX   XXXX")
  end

  def test_read_unicode
    f = Cpr::Field.create_type('A', 'f1', 3..5)
    assert_equal(Encoding::UTF_8, f.read("XXXABCXXXX".encode("binary")).encoding)
  end

  def test_write
    f = Cpr::Field.create_type('A', 'f1', 3..5)
    assert_equal "XXXABCXXXX", f.write("XXX   XXXX", "ABC")
  end

  def test_write_unicode
    f = Cpr::Field.create_type('A', 'f1', 3..5)
    assert_equal "XXXüæøXXXX".encode("iso-8859-1"), f.write("XXX   XXXX", "üæø")
  end


  def test_write_overflow_truncates
    f = Cpr::Field.create_type('A', 'f1', 3..5)
    assert_equal "XXXABCXXXX", f.write("XXX   XXXX", "ABCDEFG")
  end

  def test_write_underflow_fills
    f = Cpr::Field.create_type('A', 'f1', 3..5)
    assert_equal "XXXA  XXXX", f.write("XXXXXXXXXX", "A")
  end

end
