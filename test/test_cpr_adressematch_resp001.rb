# coding: utf-8
require 'helper'
require 'date'

class TestCprAdressematchResp001 < Test::Unit::TestCase
  def example_no_pnr
    input = "001A0006          20020107P 00000000000001000000000000Niels Nielsen                     19930203                                                                        Vesterbrogade 86 2                                                  1620K�benhavn V         01018204086B          Niels                                             Nielsen                                 Vesterbrogade       200111111130"\
      .force_encoding("iso-8859-1")
    Cpr::Adressematch::Resp001.new(input)
  end

  def example_pnr
    input = "001PNR=0801852063 20020107P 00000000000001000000000000Niels Nielsen                     19930203                                                                        Vesterbrogade 86 2                                                  1620K�benhavn V         01018204086B          Niels                                             Nielsen                                 Vesterbrogade       200111111130"\
      .force_encoding("iso-8859-1")
    Cpr::Adressematch::Resp001.new(input)
  end

  
  def test_no_pnr
    example = example_no_pnr
    assert_nil example.pnr
    assert_nil example.birthday
    assert_nil example.pnr_assigned_digits
  end

  def test_pnr_pnr
    assert_equal "0801852063", example_pnr.pnr
  end

  def test_pnr_birthday
    assert_equal Date.new(1985, 1, 8), example_pnr.birthday
  end

  def test_pnr_assigned_digits
    assert_equal "2063", example_pnr.pnr_assigned_digits
  end


end
