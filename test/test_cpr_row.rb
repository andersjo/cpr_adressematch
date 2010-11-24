# coding: utf-8
require 'helper'

class TestCprRow < Test::Unit::TestCase
  def setup
    @row = Cpr::Row.dup
  end

  def test_row_length
    @row.field 'f1', 'A', 0..2
    @row.field 'f2', 'A', 3..6
    assert_equal 7, @row.length
  end

  def test_non_contiguous_field_throws_error
    @row.field 'f1', 'A', 0..2
    assert_raise(RuntimeError) {
      @row.field 'f2', 'A', 4..6
    }
    assert_raise(RuntimeError) {
      @row.field 'f2', 'A', 2..6
    }
  end

  def test_fill
    @row.field 'f1', 'A', 0..2
    @row.field 'f1', 'N', 3..5
    assert_equal "      ", @row.fill
  end
  
  def test_field_by_name_existing_and_non_existing
    @row.field 'f1', 'A', 0..2
    assert_kind_of(Cpr::AlphanumericField, @row.field_by_name('f1'))
    assert_raise(RuntimeError) { @row.field_by_name('non_existing_field') }
  end

  def test_read_field
    @row.field 'f1', 'N', 0..2
    instance = @row.new
    assert_equal nil, instance['f1']
  end

  def test_write_field
    @row.field 'f1', 'N', 0..2
    instance = @row.new
    instance['f1'] = 100
    assert_equal 100, instance['f1']
  end

  def test_parse_valid_input
    @row.field 'f1', 'N', 0..2
    @row.field 'f2', 'A', 3..5
    str = "999ABC"
    valid_parse = @row.new(str)
    assert_not_nil valid_parse
    assert_equal 999, valid_parse['f1']
    assert_equal "ABC", valid_parse['f2']
  end

  def test_create_with_valid_input
    @row.field 'f1', 'N', 0..2
    @row.field 'f2', 'A', 3..5
    instance = @row.create('f1' => 999, 'f2' => 'ABC')
    assert_equal '999ABC', instance.data
  end

end
