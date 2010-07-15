# coding: utf-8
require 'helper'

class TestCprField < Test::Unit::TestCase
  def test_creates_correct_type
    assert_kind_of Cpr::AlphanumericField, Cpr::Field.create_type('A', 'f1', 0..10)
    assert_kind_of Cpr::NumericField, Cpr::Field.create_type('N', 'f1', 0..10)
    assert_raise(RuntimeError) {
      Cpr::Field.create_type('X', 'f1', 0..10)
    }
  end

end
