# coding: utf-8
require 'helper'

class TestCprDoc < Test::Unit::TestCase
  def test_from_file
    doc = Cpr::RespDocument.from_file("data/cpr_uddata_eksempel.txt")
    assert_equal 8, doc.rows.length
    assert doc.rows.none?(&:nil?), "nil rows not allowed"
    names = File.open("data/cpr_uddata_eksempel.txt", "r:iso-8859-1")\
      .read.split("\r\n").map do |line|
      line[54..86].strip
    end
    doc.rows.zip(names) do |row,name|
      assert_kind_of(Cpr::Adressematch::Resp001, row)
      assert_equal name, row['Adrnvn']
    end
  end

  def test_groups
    doc = Cpr::RespDocument.from_file("data/cpr_uddata_eksempel.txt")
    counts = {}
    doc.groups.each do |name,rows|
      counts[name] = rows.count
    end
    assert_equal 1, doc.groups.keys.size
    assert_equal 8, counts["Resp001"]
  end
end
