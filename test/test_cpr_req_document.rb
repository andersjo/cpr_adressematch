# coding: utf-8
require 'helper'

class TestCprReqDocument < Test::Unit::TestCase
  def test_combines_records
    row = Cpr::Row.dup
    row.field 'name', 'A', 0..99
    doc = Cpr::ReqDocument.new
    doc.rows << row.create('name' => "NameA")
    doc.rows << row.create('name' => "NameB")
    assert_match(/^NameA {95}\r\nNameB {95}$/, doc.data)
  end
end
